//
//  SchoolDetailView.swift
//  NYCSchool
//
//  Created by Rakesh Shetty on 11/3/22.
//

import SwiftUI

// MARK: Struct

/// This struct represent school detail data view
///
///  It has ScrollView, Vertical Stack
struct SchoolDetailView: View {

    // MARK: Public Properties

    var score: Score?
    var school: School?
    var imageName: String

    // MARK: Properties

    /// A view that displays ScrollView
    ///
    /// ScrollView contain VStacks
    /// VStack contains Image, school name and sat Avg Score
    /// VStack contains requirements
    /// VStack contains neighourhood
    /// VStack contains  bus and subway
    var body: some View {
        ScrollView {
            VStack(spacing: 2.0) {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15.0, style: .continuous))

                if let schoolName = school?.schoolName {
                    Text(schoolName)
                        .font(.title2)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                }
                if let writingScore = score?.satWritingAvgScore,
                   let readingScore = score?.satCriticalReadingAvgScore,
                   let mathScore = score?.satMathAvgScore {
                    let avgScores = ["Sat Writing Avg Score :": writingScore,
                                     "Sat Critical Reading Avg Score :": readingScore,
                                     "Sat Math Avg Score  :": mathScore]

                    VStack {
                        ForEach(avgScores.sorted(by: >), id: \.key) { key, value in
                            HStack {
                                Text(key)
                                    .foregroundColor(.black)
                                Text(value)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(5)
                        }
                        .padding(EdgeInsets(top: 10.0, leading: 20.0, bottom: 10.0, trailing: 20.0))
                        .navigationTitle("NYC Schools")
                    }
                }

                VStack(spacing: 10) {
                    if let overviewParagraph = school?.overviewParagraph {
                        Text("Overview :")
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(overviewParagraph)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .multilineTextAlignment(.leading)
                    }
                }
                .padding()

                VStack(spacing: 10) {
                    if let requirement11 = school?.requirement11,
                       let requirement21 = school?.requirement21,
                       let requirement31 = school?.requirement31,
                       let requirement41 = school?.requirement41,
                       let requirement51 = school?.requirement51 {
                        Text("Requirements :")
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(requirement11)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                        Text(requirement21)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                        Text(requirement31)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                        Text(requirement41)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                        Text(requirement51)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                    }
                }
                .padding()

                VStack(spacing: 10) {
                    if let neighborhood = school?.neighborhood {
                        Text("Neighborhood :")
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(neighborhood)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding()

                VStack(spacing: 10) {
                    if let subway = school?.subway,
                       let bus = school?.bus {
                        Text("Transportation :")
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        HStack {
                            Text("Subway")
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text(subway)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding()

                        HStack {
                            Text("Bus")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.center)
                            Text(bus)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding()
                    }

                }
                .padding()

            }
            .padding(16)
            .background(Color(red: 247.0 / 255.0, green: 245.0 / 255.0, blue: 244.0 / 255.0))
            .cornerRadius(15)
        }
        .background(Color(red: 247.0 / 255.0, green: 245.0 / 255.0, blue: 244.0 / 255.0))
    }
}

// MARK: Struct

/// This is to preview SchoolDetailView without running project
///
///  This will show hardcode school data
struct SchoolDetailView_Previews: PreviewProvider {

    // MARK: Static Properties

    static var previews: some View {
        SchoolDetailView(score: Score(id: UUID(),
                                      dbn: "01M292",
                                      schoolName: "HENRY STREET SCHOOL FOR INTERNATIONAL STUDIES",
                                      numOfSatTestTakers: "29",
                                      satCriticalReadingAvgScore: "355",
                                      satMathAvgScore: "404",
                                      satWritingAvgScore: "363"),
                         school: School(id: UUID(),
                                        schoolName: "Clinton School Writers & Artists, M.S. 260",
                                        boro: nil,
                                        overviewParagraph: "HENRY STREET SCHOOL",
                                        neighborhood: "Seagate-Coney Island",
                                        phoneNumber: "212-524-4360",
                                        faxNumber: "212-524-4365",
                                        schoolEmail: "admissions@theclintonschool.net",
                                        website: "www.theclintonschool.net",
                                        subway: "1, 2, 3, F, M to 14th St - 6th Ave; 4",
                                        bus: "BM1, BM2, BM3, BM4, BxM10, BxM6, BxM7, BxM8, BxM9, M1",
                                        totalStudents: "376",
                                        extracurricularActivities: "CUNY College Now, Te",
                                        schoolSports: "Cross Country, Track",
                                        requirement11: "Course Grades: English (87-100), Math (83-100)",
                                        requirement21: "Standardized Test Scores: English Language Arts (2.8-4.5))",
                                        requirement31: "Attendance and Punctuality",
                                        requirement41: "Attendance and Punctuality",
                                        requirement51: "Attendance and Punctuality",
                                        primaryAddressLine1: "10 East 15th Street",
                                        city: "Manhattan",
                                        zip: "10003",
                                        stateCode: "NY"),
                         imageName: "School1")
    }
}
