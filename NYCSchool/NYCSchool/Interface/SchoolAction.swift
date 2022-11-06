//
//  SchoolAction.swift
//  NYCSchool
//
//  Created by Rakesh Shetty on 9/22/22.
//

import Combine

protocol SchoolAction {

    // MARK: Interface

    func getSchools() -> AnyPublisher<[School]?, Error>
    func getScores() -> AnyPublisher<[Score]?, Error>
}
