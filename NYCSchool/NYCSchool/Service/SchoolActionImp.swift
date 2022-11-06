//
//  SchoolActionImp.swift
//  NYCSchool
//
//  Created by Rakesh Shetty on 9/22/22.
//

import Combine

class SchoolActionImp: SchoolAction {

    // MARK: Functions

    func getSchools() -> AnyPublisher<[School]?, Error> {
        return BaseAPI.getSchools()
            .eraseToAnyPublisher()
    }

    func getScores() -> AnyPublisher<[Score]?, Error> {
        return BaseAPI.getScores()
            .eraseToAnyPublisher()
    }
}
