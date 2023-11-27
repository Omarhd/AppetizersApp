//
//  UserModel.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 22/11/2023.
//

import Foundation

struct User: Codable {
    var name       = ""
    var phone        = ""
    var email           = ""
    var birthdate       = Date()
    var extraNapkins    = false
    var frequentRefills = false
}
