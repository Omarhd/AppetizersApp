//
//  PrimaryButtonView.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 12/11/2023.
//

import SwiftUI

struct PrimaryButtonView: View {
    
    let title: LocalizedStringKey

    var body: some View {
        Text(title)
        .frame(width: 260, height: 50)
        .foregroundColor(.white)
        .background(.brandPrimary.gradient)
        .cornerRadius(12)
        .padding(.bottom)
    }
}

#Preview {
    PrimaryButtonView(title: "Place Order")
}
