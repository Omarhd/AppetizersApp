//
//  ReloadView.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 24/11/2023.
//

import SwiftUI

struct ReloadView: View {
    
    @StateObject private var viewModel = AppetizerViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "exclamationmark.shield.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .scaledToFit()
                .controlSize(.regular)
            
            Text("we are unable to fetch data for now please retry again.")
                .multilineTextAlignment(.center)
                .font(.body)
                .padding()
                .foregroundColor(.gray)

            Button {
                // handle action
                viewModel.getAppetizers()
            } label: {
                Text("Retry")
            }
            .standardButtonStyle().tint(.pink)
        }
    }
}

#Preview {
    ReloadView()
}
