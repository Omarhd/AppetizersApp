//
//  EditProfileView.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 15/11/2023.
//

import SwiftUI

struct EditProfileView: View {
    
    @ObservedObject var viewModel: SettingsViewModel
    @State private var editedFullName: String = ""
    @State private var editedPhoneNumber: String = ""
    @State private var isImagePickerPresented: Bool = false
    @State private var selectedImage: UIImage?

    var body: some View {
        Form {
            Section(header: Text("Edit Profile")) {
                VStack {
                    // Display the current profile image
                    Image(uiImage: selectedImage ?? UIImage(systemName: "person.circle.fill")!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .shadow(radius: 5)
                        .onTapGesture {
                            // Show image picker when tapped
                            isImagePickerPresented = true
                        }

                    // Image Picker
                    Button {
                        isImagePickerPresented = true
                    } label: {
                        Text("Change Picture")
                    }
                }

                TextField("Full Name", text: $editedFullName)
                TextField("Phone Number", text: $editedPhoneNumber)
            }

            Section {
                Button("Save Changes") {
                    // Save changes to the view model
                    viewModel.user.fullName = editedFullName
                    viewModel.user.phoneNumber = editedPhoneNumber

                    // Pop view to return to the settings view
                    // This is a simple example; you might need a more sophisticated navigation handling
                    // depending on your app structure and navigation flow
                    // For example, you can use presentationMode or NavigationLink isActive
                }
            }
        }
        .navigationBarTitle("Edit Profile")
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(isPresented: $isImagePickerPresented, selectedImage: $selectedImage)
                .edgesIgnoringSafeArea(.all)
                .onDisappear {
                    // Handle the selected image when the image picker is dismissed
                    if let image = selectedImage {
                        // Handle the selected image (e.g., save it to the view model)
                         viewModel.user.profileImage = image
                    }
                }
        }
    }
}


#Preview {
    EditProfileView(viewModel: SettingsViewModel())
}
