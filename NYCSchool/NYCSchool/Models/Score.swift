//
//  Body.swift
//  LoveEvery
//
//  Created by Rakesh Shetty on 9/23/22.
//

import Foundation

// MARK: struct

/// This struct represent score data
///
///  It contains data like satCriticalReadingAvgScore., numOfSatTestTakers, satMathAvgScore etc.
///  Can add/delete variable based on requirement.
///  Adopt to Codable
public struct Score: Codable, Hashable, Identifiable {

    // MARK: Public Properties

    public var id = UUID()
    public var dbn: String?
    public var schoolName: String?
    public var numOfSatTestTakers: String?
    public var satCriticalReadingAvgScore: String?
    public var satMathAvgScore: String?
    public var satWritingAvgScore: String?

    // MARK: Enum

    /// This enum represent keys of data
    ///
    ///  Left respresent the front end variable name and right side respresent response variable name
    private enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case numOfSatTestTakers = "num_of_sat_test_takers"
        case satCriticalReadingAvgScore = "sat_critical_reading_avg_score"
        case satMathAvgScore = "sat_math_avg_score"
        case satWritingAvgScore = "sat_writing_avg_score"
    }
}
