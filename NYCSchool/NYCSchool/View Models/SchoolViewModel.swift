//
//  SchoolViewModel.swift
//  NYCSchool
//
//  Created by Rakesh Shetty on 11/3/22.
//

import Foundation
import Resolver
import Combine

final class SchoolViewModel: ObservableObject {

    // MARK: Public Published Properties

    @Published var schools = [School]()
    @Published var scores = [Score]()

    // MARK: Private Depenencies Properties

    @Injected private var schoolAction: SchoolAction

    // MARK: Private Published Properties

    @Published private(set) var state: SchoolViewModelState = .idle

    // MARK: Private Properties

    private var schoolEntityList = [SchoolEntity]()
    private var scoreEntityList = [ScoreEntity]()
    private let context = PersistenceController.shared.container.viewContext
    private var cancellable = Set<AnyCancellable>()

    // MARK: initialize method

    /// fetch the schools and scores from core data.
    ///
    /// Use this init to fetch request School and Score values.
//    init() {
//        super.init()
//        self.fetchSchool()
//        self.fetchScore()
//    }
}

extension SchoolViewModel {

    // MARK: Public Functions

    /// Get School and Score array.
    ///
    /// Use this method to call School and Score JSON API.  Using Publiser Zip operator to combine two publisers.
    /// It provides the schools array and  score array
    /// Receive the value using combine and assign to global variables
    func getSchools() {
        state = .loading
        checkFetchData()
        guard schoolEntityList.isEmpty || scoreEntityList.isEmpty else {
            setupFetchData()
            return
        }
        Publishers.Zip(schoolAction.getSchools(),
                       schoolAction.getScores())
        .sink(receiveCompletion: { [unowned self] completion in
            guard case let .failure(error) = completion else {
                return
            }

            self.state = .failed(error)
            print(error)
        }, receiveValue: { [unowned self] in
            if let schools = $0 {
                self.schools = schools
            }
            if let scores = $1 {
                self.scores = scores
            }

            self.state = .loaded(self.schools)
            self.saveData()
        })
        .store(in: &cancellable)
    }
}

extension SchoolViewModel {

    // MARK: Private Functions

    private func checkFetchData() {
        fetchSchool()
        fetchScore()
    }

    private func fetchSchool() {
        let context = PersistenceController.shared.container.viewContext
        let request = SchoolEntity.fetchRequest()
        do {
            schoolEntityList = try context.fetch(request)
        } catch {
            print(error)
        }
    }

    private func fetchScore() {
        let request = ScoreEntity.fetchRequest()
        do {
            scoreEntityList = try context.fetch(request)
        } catch {
            print(error)
        }
    }

    private func setupFetchData() {
        schoolEntityList.forEach { schoolEntity in
            let school = School(id: UUID(),
                                dbn: schoolEntity.dbn,
                                schoolName: schoolEntity.schoolName,
                                overviewParagraph: schoolEntity.overviewParagraph,
                                neighborhood: schoolEntity.neighborhood,
                                phoneNumber: schoolEntity.phoneNumber,
                                faxNumber: schoolEntity.faxNumber,
                                schoolEmail: schoolEntity.schoolEmail,
                                website: schoolEntity.website,
                                subway: schoolEntity.subway,
                                bus: schoolEntity.bus,
                                requirement11: schoolEntity.requirement11,
                                requirement21: schoolEntity.requirement21,
                                requirement31: schoolEntity.requirement31,
                                requirement41: schoolEntity.requirement41,
                                requirement51: schoolEntity.requirement51,
                                primaryAddressLine1: schoolEntity.primaryAddressLine1,
                                city: schoolEntity.city,
                                zip: schoolEntity.zip,
                                stateCode: schoolEntity.stateCode)
            schools.append(school)
        }

        scoreEntityList.forEach { scoreEntity in
            let score = Score(id: UUID(),
                              dbn: scoreEntity.dbn,
                              schoolName: scoreEntity.schoolName,
                              numOfSatTestTakers: scoreEntity.numOfSatTestTakers,
                              satCriticalReadingAvgScore: scoreEntity.satCriticalReadingAvgScore,
                              satMathAvgScore: scoreEntity.satMathAvgScore,
                              satWritingAvgScore: scoreEntity.satWritingAvgScore)
            scores.append(score)
        }

        state = .loaded(schools)
    }

    private func saveData() {
        guard schools.count > 0 else {
            return
        }

        schools.forEach { school in
            saveSchoolData(school)
        }

        scores.forEach { score in
            saveScoreData(score)
        }
    }

    private func saveSchoolData(_ school: School) {
        let viewContext = PersistenceController.shared.container.viewContext
        let schoolEntity = SchoolEntity(context: viewContext)
        schoolEntity.schoolName = school.schoolName
        schoolEntity.overviewParagraph = school.overviewParagraph
        schoolEntity.neighborhood = school.neighborhood
        schoolEntity.phoneNumber = school.phoneNumber
        schoolEntity.faxNumber = school.faxNumber
        schoolEntity.schoolEmail = school.schoolEmail
        schoolEntity.website = school.website
        schoolEntity.subway = school.subway
        schoolEntity.bus = school.bus
        schoolEntity.requirement11 = school.requirement11
        schoolEntity.requirement21 = school.requirement21
        schoolEntity.requirement31 = school.requirement31
        schoolEntity.requirement41 = school.requirement41
        schoolEntity.requirement51 = school.requirement51
        schoolEntity.primaryAddressLine1 = school.primaryAddressLine1
        schoolEntity.city = school.city
        schoolEntity.zip = school.zip
        schoolEntity.stateCode = school.stateCode
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
    }

    private func saveScoreData(_ score: Score) {
        let viewContext = PersistenceController.shared.container.viewContext
        let scoreEntity = ScoreEntity(context: viewContext)
        scoreEntity.dbn = score.dbn
        scoreEntity.schoolName = score.schoolName
        scoreEntity.numOfSatTestTakers = score.numOfSatTestTakers
        scoreEntity.satCriticalReadingAvgScore = score.satCriticalReadingAvgScore
        scoreEntity.satMathAvgScore = score.satMathAvgScore
        scoreEntity.satWritingAvgScore = score.satWritingAvgScore
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
    }
}
