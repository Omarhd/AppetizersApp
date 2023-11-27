//
//  EmptyState.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 22/11/2023.
//

import SwiftUI

struct EmptyState: View {
    
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
            .offset(y: -50)
        }
    }
}


#Preview {
    EmptyState(imageName: "handbag.circle", message: "This is our test message.\nI'm making it a little long for testing.")
}
