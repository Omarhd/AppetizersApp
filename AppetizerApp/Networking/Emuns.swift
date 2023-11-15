//
//  Emuns.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 12/11/2023.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case unableToComplete
    // Add more cases as needed
}
