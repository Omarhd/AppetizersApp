//
//  SetitngsView.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 15/11/2023.
//

import SwiftUI

struct SettingsView: View {
   
    @ObservedObject var viewModel = SettingsViewModel()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Profile")) {
                    HStack(spacing: 20) {
                        // Circled Image
                        ProfileImageView(image: $viewModel.user.profileImage)

                        Spacer()
                        
                        // QR Code Button
                        Button {
                            viewModel.isPresentingQRCode = true
                        } label: {
                            QRCodeButton()
                        }
                    }
                        
                        // Full Name and Phone Number
                        Text(viewModel.user.fullName)
                        Text(viewModel.user.phoneNumber)
                        
                        // Edit Profile Button
                        NavigationLink(destination: EditProfileView(viewModel: viewModel)) {
                            Text("Edit Profile")
                                .foregroundColor(.cyan)
                        }
                    
                }

                Section(header: Text("Options")) {
                    // Change App Language
                    Toggle("Switch to Arabic", isOn: $viewModel.appSettings.dummyOption)
                    
                    // Other dummy options
                    Toggle("Dark Mode", isOn: $viewModel.appSettings.appApearance)
                }
                .toggleStyle(.switch).tint(.brandPrimary)

                Section(header: Text("Preferences")) {
                    // Dummy Preferences
                    Toggle("Dummy Preference", isOn: $viewModel.appSettings.dummyPreference)
                    
                    // App Version
                    Text("V " + viewModel.appSettings.appVersion)
                        .multilineTextAlignment(.center)
                }
                .toggleStyle(.switch).tint(.brandPrimary)

            }
            .navigationBarTitle("Settings")
            .sheet(isPresented: $viewModel.isPresentingQRCode) {
                QRCodePreviewerView()
                    .presentationDetents([.medium])
            }
        }
        .preferredColorScheme(viewModel.isDarkModeOn ? .dark : .light)
    }
}

#Preview {
    SettingsView()
}

struct ProfileImageView: View {
    
    @Binding var image: UIImage?
    
    var body: some View {
        Image(uiImage: image ?? UIImage(systemName: "person.circle.fill")!)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 80, height: 80)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 5)
    }
}
