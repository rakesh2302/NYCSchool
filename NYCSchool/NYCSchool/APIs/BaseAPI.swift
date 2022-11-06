//
//  BaseAPI.swift
//  NYCSchool
//
//  Created by Rakesh Shetty on 9/23/22.
//

import Combine
import Foundation

class BaseAPI {

    // MARK: Public static Property

    public static var schoolURL = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    public static var scoreURL = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"

    // MARK: class Functions

    class func getSchools() -> AnyPublisher<[School]?, Error> {
        var dataTask: URLSessionDataTask?
        return Deferred {
            Future<[School]?, Error>.init { promise in
                dataTask = getSchoolsWithRequestBuilder().execute { result -> Void in
                    switch result {
                    case let .success(response):
                        promise(.success(response.body!))
                    case let .failure(error):
                        promise(.failure(error))
                    }
                }
            }
            .handleEvents(receiveCancel: {
                dataTask?.cancel()
                dataTask = nil
            })
        }
        .eraseToAnyPublisher()
    }

    class func getScores() -> AnyPublisher<[Score]?, Error> {
        var dataTask: URLSessionDataTask?
        return Deferred {
            Future<[Score]?, Error>.init { promise in
                dataTask = getScoresWithRequestBuilder().execute { result -> Void in
                    switch result {
                    case let .success(response):
                        promise(.success(response.body!))
                    case let .failure(error):
                        promise(.failure(error))
                    }
                }
            }
            .handleEvents(receiveCancel: {
                dataTask?.cancel()
                dataTask = nil
            })
        }
        .eraseToAnyPublisher()
    }
}

extension BaseAPI {

    // MARK: Private Enum

    private enum Endpoint: String {
        case add = "/proto/messages"
        case get = "/proto/messages/{user}"
    }

    // MARK: Private class Functions

    private class func getSchoolsWithRequestBuilder() -> RequestBuilder<[School]> {
        let urlString = schoolURL
        let urlSessionRequestBuilder = UrlSessionRequestBuilder<[School]>.init(urlString: urlString,
                                                                             method: HTTPMethod.get.rawValue,
                                                                               parameters: [:])
        return urlSessionRequestBuilder
    }

    private class func getScoresWithRequestBuilder() -> RequestBuilder<[Score]> {
        let urlString = scoreURL
        let urlSessionRequestBuilder = UrlSessionRequestBuilder<[Score]>.init(urlString: urlString,
                                                                             method: HTTPMethod.get.rawValue,
                                                                             parameters: nil)
        return urlSessionRequestBuilder
    }
}
