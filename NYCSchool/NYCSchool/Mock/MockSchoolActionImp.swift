//
//  MockSchoolActionImp.swift
//  LoveEvery
//
//  Created by Rakesh Shetty on 9/24/22.
//

import Combine
import UIKit

class MockSchoolActionImp: SchoolAction {

    // MARK: Functions

    func getSchools() -> AnyPublisher<[School]?, Error> {
        let school = School(id: UUID(),
                       schoolName: "Clinton School Writers & Artists, M.S. 260",
                       overviewParagraph: "HENRY STREET SCHOOL FOR INTERNATIONAL",
                       neighborhood: "Seagate-Coney Island",
                       phoneNumber: "212-524-4360",
                       faxNumber: "212-524-4365",
                       schoolEmail: "admissions@theclintonschool.net",
                       website: "www.theclintonschool.net",
                       subway: "1, 2, 3, F, M to 14th St - 6th Ave; 4, 5",
                       bus: "BM1, BM2, BM3, BM4, BxM10, BxM6, BxM7, BxM8, BxM9, M1",
                       totalStudents: "376",
                       extracurricularActivities: "CUNY College Now, Te",
                       schoolSports: "Cross Country, Track and Field, Soccer, Flag Football, Basketball",
                       requirement11: "Course Grades: English (87-100), Math (83-100)",
                       requirement21: "Standardized Test Scores: English Language Arts (2.8-4.5), Math (2.8-4.5)",
                       requirement31: "Attendance and Punctuality",
                       requirement41: "Attendance and Punctuality",
                       requirement51: "Attendance and Punctuality",
                       primaryAddressLine1: "10 East 15th Street",
                       city: "Manhattan",
                       zip: "10003",
                       stateCode: "NY")
        return Just([school])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func getScores() -> AnyPublisher<[Score]?, Error> {
        let score = Score(id: UUID(),
                          dbn: "01M292",
                          schoolName: "HENRY STREET SCHOOL FOR INTERNATIONAL STUDIES",
                          numOfSatTestTakers: "29",
                          satCriticalReadingAvgScore: "355",
                          satMathAvgScore: "404",
                          satWritingAvgScore: "363")
        return Just([score])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
