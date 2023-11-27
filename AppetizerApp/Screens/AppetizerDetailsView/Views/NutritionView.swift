//
//  NutritionView.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 12/11/2023.
//

import SwiftUI

struct NutritionView: View {
    
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            
            Text(value)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

#Preview {
    NutritionView(title: "Protin", value: "22")
}
