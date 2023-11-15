//
//  NutritionView.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 12/11/2023.
//

import SwiftUI

struct NutritionView: View {
    
    let appetizer: Appetizer

    var body: some View {
        HStack(spacing: 40) {
            VStack(spacing: 6) {
                Text("protein")
                    .bold()
                    .font(.caption)
                
                Text("\(appetizer.protein)")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                    .italic()
            }
            
            VStack(spacing: 6) {
                Text("Calories")
                    .bold()
                    .font(.caption)
                
                Text("\(appetizer.calories)")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                    .italic()
            }
            
            VStack(spacing: 6) {
                Text("Carbs")
                    .bold()
                    .font(.caption)
                
                Text("\(appetizer.carbs)")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                    .italic()
            }
        }
    }
}

#Preview {
    NutritionView(appetizer: MocData.sampleAppetizer)
}
