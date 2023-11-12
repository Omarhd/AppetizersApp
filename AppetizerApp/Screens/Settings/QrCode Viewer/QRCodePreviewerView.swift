//
//  QRCodePreviewerView.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 13/11/2023.
//

import SwiftUI

struct QRCodePreviewerView: View {
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                    .frame(width: 280, height: 320)

                VStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 3))
                        .padding(.top, 20)

                    // Add QR Code here
                    Image(systemName: "qrcode") // Placeholder for QR Code, replace with your QR Code image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 160, height: 160)
                        .foregroundColor(.white)

                    // Add more information as needed
                }
                .padding(.bottom, 20)
            }
        }
    }
}

#Preview {
    QRCodePreviewerView()
}
