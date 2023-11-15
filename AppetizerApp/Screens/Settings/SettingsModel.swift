//
//  SettingsModel.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 15/11/2023.
//

import SwiftUI

struct User {
    var fullName: String
    var phoneNumber: String
    var profileImage: UIImage?
    // Add other necessary properties
}

struct AppSettings {
    var appLanguage: String
    var dummyOption: Bool
    var appApearance: Bool
    var dummyPreference: Bool
    var appVersion: String
}
