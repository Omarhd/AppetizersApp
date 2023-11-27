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
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color.brandPrimary)
            .cornerRadius(10)
    }
}

#Preview {
    PrimaryButtonView(title: "Place Order")
}
