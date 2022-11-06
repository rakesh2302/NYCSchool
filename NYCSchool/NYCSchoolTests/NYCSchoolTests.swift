//
//  NYCSchoolTests.swift
//  NYCSchoolTests
//
//  Created by Rakesh Shetty on 11/3/22.
//

import XCTest
import Resolver
import Combine
@testable import NYCSchool

class NYCSchoolTests: XCTestCase {

    private var viewModel: SchoolViewModel = SchoolViewModel()
    private var cancellable = Set<AnyCancellable>()

    override func setUpWithError() throws {
        Resolver.register { MockSchoolActionImp() }
        .implements(SchoolAction.self)
    }

    override func tearDownWithError() throws {
        cancellable.removeAll()
    }

    func testSchools() throws {
        viewModel.getSchools()
        let expectation = expectation(description: "Load Schools")

        viewModel.$state
            .sink { _ in expectation.fulfill() }
            .store(in: &cancellable)

        waitForExpectations(timeout: 5.0)

        XCTAssertEqual(viewModel.schools.count, 1)
    }

    func testScores() throws {
        viewModel.getSchools()
        let expectation = expectation(description: "Load Scores")

        viewModel.$state
            .sink { _ in expectation.fulfill() }
            .store(in: &cancellable)

        waitForExpectations(timeout: 5.0)

        XCTAssertEqual(viewModel.scores.count, 1)
    }
}
