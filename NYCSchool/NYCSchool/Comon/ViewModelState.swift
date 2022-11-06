//
//  ViewModelState.swift
//  NYCSchool
//
//  Created by Rakesh Shetty on 11/4/22.
//

// MARK: Enum

/// This enum represent loading state of school and score data
///
///  There are four state: idle, loading, failed and loaded.
///  ToDo - Can add more state based on the requirement
///
/// - Prramaters:
///   - Error :  This will  have error detail
///   - [School] :  This will  have array of type School
enum SchoolViewModelState {
    case idle
    case loading
    case failed(Error)
    case loaded([School])
}
