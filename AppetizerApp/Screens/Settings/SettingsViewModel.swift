//
//  SettingsViewModel.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 15/11/2023.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
 
    @Published var user: User
    @Published var appSettings: AppSettings
    @Published var isPresentingQRCode: Bool = false
    
    @AppStorage("isDarkModeOn") var isDarkModeOn: Bool = false

    
    init() {
        // Initialize with dummy data
        self.user = User(fullName: "Omar Abdulrahman", phoneNumber: "+971581259914", profileImage: UIImage(named: "profilePicture"))
        self.appSettings = AppSettings(appLanguage: "English", dummyOption: true, appApearance: false, dummyPreference: false, appVersion: "1.2")
    }
    
    // Add any necessary functions for profile editing, language change, etc.
}
