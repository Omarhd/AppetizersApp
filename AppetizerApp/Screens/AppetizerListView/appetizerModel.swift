//
//  appetizerModel.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 12/11/2023.
//

import Foundation

import Foundation

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let price: Double
    let description: String
    let imageURL: String
    let name: String
    let protein, calories, carbs: Int
}

struct MocData {
    
    static let sampleAppetizer = Appetizer(id: 1,
                                           price: 20.233332,
                                           description: "Seasoned shrimp from the depths of the Atlantic Ocean, Seasoned shrimp from the depths of the Atlantic Ocean",
                                           imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/blackened-shrimp.jpg",
                                           name: "Blackened Shrimp",
                                           protein: 4,
                                           calories: 450,
                                           carbs: 3)

    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
