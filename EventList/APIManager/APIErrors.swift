//
//  APIErrors.swift
//  EventList
//

enum APIErrors: Error {
    case custom(message: String)
}

typealias Handler = (Swift.Result<Any?, APIErrors>) -> Void
