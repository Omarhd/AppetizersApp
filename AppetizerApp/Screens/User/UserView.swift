//
//  UserView.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 22/11/2023.
//

import SwiftUI

struct UserView: View {
    
    @StateObject var viewModel = UserViewModel()
    @FocusState private var focusedTextField: FormTextField?

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("Name", text: $viewModel.user.name)
                        .focused($focusedTextField, equals: .name)
                        .onSubmit { focusedTextField = .phone }
                        .submitLabel(.next)

                    TextField("Phone", text: $viewModel.user.phone)
                        .focused($focusedTextField, equals: .phone)
                        .onSubmit { focusedTextField = .email }
                        .submitLabel(.next)
                        .keyboardType(.namePhonePad)
                    
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit { focusedTextField = nil }
                        .submitLabel(.done)
                    
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled(true)
                        .disableAutocorrection(true)
                    
                    DatePicker("Birth Date", selection: $viewModel.user.birthdate, displayedComponents: .date)
                    
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                }
                
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                }
                .toggleStyle(.switch).tint(.brandPrimary)
            }
            
            .navigationTitle("🙍🏽‍♂️ Profile")
        }
        .onAppear {
            viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alertItem) { alert in
            Alert(title: alert.title,
                  message: alert.message,
                  dismissButton: alert.dismissButton)
        }
    }
}

#Preview {
    UserView()
}
