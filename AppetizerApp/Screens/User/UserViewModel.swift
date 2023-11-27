//
//  UserViewModel.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 22/11/2023.
//

import SwiftUI


final class UserViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    
    @Published var user = User()
    @Published var alertItem: AlertItem?

    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }

    func retrieveUser() {
        guard let userData else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    
    var isValidForm: Bool {
        guard !user.name.isEmpty && !user.phone.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }

}

enum FormTextField {
    case name, phone, email
}
