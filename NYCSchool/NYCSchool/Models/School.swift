//
//  School.swift
//  LoveEvery
//
//  Created by Rakesh Shetty on 9/23/22.
//

import Foundation

// MARK: struct

/// This struct represent school data
///
///  It contains data like schoolName., overviewParagraph, phoneNumber etc.
///  Can add/delete variable based on requirement.
///  Adopt to Codable, Hashable and Identifiable
public struct School: Codable, Hashable, Identifiable {

    // MARK: Public Properties

    public var id = UUID()
    public var dbn: String?
    public var schoolName: String?
    public var boro: String?
    public var overviewParagraph: String?
    public var school10thSeats: String?
    public var academicopportunities1: String?
    public var academicopportunities2: String?
    public var ellPrograms: String?
    public var neighborhood: String?
    public var buildingCode: String?
    public var location: String?
    public var phoneNumber: String?
    public var faxNumber: String?
    public var schoolEmail: String?
    public var website: String?
    public var subway: String?
    public var bus: String?
    public var grades2018: String?
    public var finalgrades: String?
    public var totalStudents: String?
    public var extracurricularActivities: String?
    public var schoolSports: String?
    public var attendanceRate: String?
    public var pctStuEnoughVariety: String?
    public var pctStuSafe: String?
    public var schoolAccessibilityDescription: String?
    public var directions1: String?
    public var requirement11: String?
    public var requirement21: String?
    public var requirement31: String?
    public var requirement41: String?
    public var requirement51: String?
    public var offerRate1: String?
    public var program1: String?
    public var code1: String?
    public var interest1: String?
    public var method1: String?
    public var seats9ge1: String?
    public var grade9gefilledflag1: String?
    public var grade9geapplicants1: String?
    public var seats9swd1: String?
    public var grade9swdfilledflag1: String?
    public var grade9swdapplicants1: String?
    public var seats101: String?
    public var admissionspriority11: String?
    public var admissionspriority21: String?
    public var admissionspriority31: String?
    public var grade9geapplicantsperseat1: String?
    public var grade9swdapplicantsperseat1: String?
    public var primaryAddressLine1: String?
    public var city: String?
    public var zip: String?
    public var stateCode: String?
    public var latitude: String?
    public var longitude: String?
    public var communityBoard: String?
    public var councilDistrict: String?
    public var censusTract: String?
    public var bin: String?
    public var bbl: String?
    public var nta: String?
    public var borough: String?

    // MARK: enum

    /// This enum represent keys of data
    ///
    ///  Left respresent the front end variable name and right side respresent response variable name
    private enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case boro
        case overviewParagraph = "overview_paragraph"
        case school10thSeats = "school_10th_seats"
        case academicopportunities1 = "academicopportunities1"
        case academicopportunities2 = "academicopportunities2"
        case ellPrograms = "ell_programs"
        case neighborhood = "neighborhood"
        case buildingCode = "building_code"
        case location
        case phoneNumber = "phone_number"
        case faxNumber = "fax_number"
        case schoolEmail = "school_email"
        case website
        case subway
        case bus
        case grades2018 = "grades2018"
        case finalgrades
        case totalStudents = "total_students"
        case extracurricularActivities = "extracurricular_activities"
        case schoolSports = "school_sports"
        case attendanceRate = "attendance_rate"
        case pctStuEnoughVariety = "pct_stu_enough_variety"
        case pctStuSafe = "pct_stu_safe"
        case schoolAccessibilityDescription = "school_accessibility_description"
        case directions1 = "directions1"
        case requirement11 = "requirement1_1"
        case requirement21 = "requirement2_1"
        case requirement31 = "requirement3_1"
        case requirement41 = "requirement4_1"
        case requirement51 = "requirement5_1"
        case offerRate1 = "offer_rate1"
        case program1 = "program1"
        case code1 = "code1"
        case interest1 = "interest1"
        case method1 = "method1"
        case seats9ge1 = "seats9ge1"
        case grade9gefilledflag1 = "grade9gefilledflag1"
        case grade9geapplicants1 = "grade9geapplicants1"
        case seats9swd1 = "seats9swd1"
        case grade9swdfilledflag1 = "grade9swdfilledflag1"
        case grade9swdapplicants1 = "grade9swdapplicants1"
        case seats101 = "seats101"
        case admissionspriority11 = "admissionspriority11"
        case admissionspriority21 = "admissionspriority21"
        case admissionspriority31 = "admissionspriority31"
        case grade9geapplicantsperseat1 = "grade9geapplicantsperseat1"
        case grade9swdapplicantsperseat1 = "grade9swdapplicantsperseat1"
        case primaryAddressLine1 = "primary_address_line_1"
        case city
        case zip
        case stateCode = "state_code"
        case latitude
        case longitude
        case communityBoard = "community_board"
        case councilDistrict = "council_district"
        case censusTract = "census_tract"
        case bin
        case bbl
        case nta
        case borough
    }
}
