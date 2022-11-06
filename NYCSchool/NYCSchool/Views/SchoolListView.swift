//
//  SchoolListView.swift
//  NYCSchool
//
//  Created by Rakesh Shetty on 11/3/22.
//

import SwiftUI

// MARK: Struct

/// This struct represent school list data view
///
///  It has Vertical Stack and nested horizontal stack .
struct SchoolListView: View {

    // MARK: Public Properties

    var school: School
    var imageName: String

    // MARK: Properties

    /// A view that displays Vertical Stack and nested horizontal stack
    ///
    /// VStack contains Image and  HStacks
    ///  HStack contains schoolName
    ///  HStack contains schoolEmail, phoneNumber, primaryAddressLine1, city, state and zip
    var body: some View {
        VStack(spacing: 2.0) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 15.0, style: .continuous))

            HStack(alignment: .firstTextBaseline) {
                if let schoolName = school.schoolName {
                    Text(schoolName)
                        .font(.title2)
                        .fontWeight(.bold)
                }
            }
            .padding()

            HStack {
                VStack {
                    if let schoolEmail = school.schoolEmail {
                        HStack {
                        Text("Email: \(schoolEmail)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    if let phoneNumber = school.phoneNumber {
                        Text("Phone Number: \(phoneNumber)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    if let primaryAddressLine1 = school.primaryAddressLine1 {
                        Text("Address:")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(1)
                        Text("\(primaryAddressLine1),")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    if let city = school.city {
                        Text("\(city),")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    if let stateCode = school.stateCode,
                       let zip = school.zip {
                        Text("\(stateCode) \(zip)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .padding(1)
        }
        .padding(16)
        .background(Color.white)
        .border(Color(red: 238.0 / 255.0,
                      green: 238.0 / 255.0,
                      blue: 238.0 / 255.0),
                width: 1.0)
        .cornerRadius(15)
    }
}

// MARK: Struct

/// This is to preview SchoolListView without running project
///
///  This will show hardcode school data
struct SchoolListView_Previews: PreviewProvider {

    // MARK: Static Properties

    static var previews: some View {
        SchoolListView(school:
                            School(id: UUID(),
                                   dbn: nil,
                                   schoolName: "Clinton School Writers & Artists, M.S. 260",
                                   boro: nil,
                                   overviewParagraph: nil,
                                   school10thSeats: nil,
                                   academicopportunities1: nil,
                                   academicopportunities2: nil,
                                   ellPrograms: nil,
                                   neighborhood: nil,
                                   buildingCode: nil,
                                   location: nil,
                                   phoneNumber: "212-524-4360",
                                   faxNumber: "212-524-4365",
                                   schoolEmail: "admissions@theclintonschool.net",
                                   website: "www.theclintonschool.net",
                                   subway: nil,
                                   bus: nil,
                                   grades2018: nil,
                                   finalgrades: nil,
                                   totalStudents: nil,
                                   extracurricularActivities: nil,
                                   schoolSports: nil,
                                   attendanceRate: nil,
                                   pctStuEnoughVariety: nil,
                                   pctStuSafe: nil,
                                   schoolAccessibilityDescription: nil,
                                   directions1: nil,
                                   requirement11: nil,
                                   requirement21: nil,
                                   requirement31: nil,
                                   requirement41: nil,
                                   requirement51: nil,
                                   offerRate1: nil,
                                   program1: nil,
                                   code1: nil,
                                   interest1: nil,
                                   method1: nil,
                                   seats9ge1: nil,
                                   grade9gefilledflag1: nil,
                                   grade9geapplicants1: nil,
                                   seats9swd1: nil,
                                   grade9swdfilledflag1: nil,
                                   grade9swdapplicants1: nil,
                                   seats101: nil,
                                   admissionspriority11: nil,
                                   admissionspriority21: nil,
                                   admissionspriority31: nil,
                                   grade9geapplicantsperseat1: nil,
                                   grade9swdapplicantsperseat1: nil,
                                   primaryAddressLine1: "10 East 15th Street",
                                   city: "Manhattan",
                                   zip: "10003",
                                   stateCode: "NY",
                                   latitude: nil,
                                   longitude: nil,
                                   communityBoard: nil,
                                   councilDistrict: nil,
                                   censusTract: nil,
                                   bin: nil,
                                   bbl: nil,
                                   nta: nil,
                                   borough: nil),
                       imageName: "School1")
    }
}
