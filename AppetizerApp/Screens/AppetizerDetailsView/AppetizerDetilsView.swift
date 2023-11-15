//
//  AppetizerDetilsView.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 12/11/2023.
//

import SwiftUI

struct AppetizerDetilsView: View {
    
    let appetizer: Appetizer
    @Binding var isShowingDetailsView: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            AppetizerRemoteImageLoader(urlString: appetizer.imageURL)
                .frame(width: 320, height: 252)
            
            VStack(spacing: 12) {
                Text(appetizer.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.5)
                
                Text(appetizer.description)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.6)
                                
                NutritionView(appetizer: appetizer)

            }
            
            Spacer()
            
            Button {

            } label: {
                PrimaryButtonView(title: "$\(appetizer.price, specifier: "%.2f") - Place Order")
            }
            
        }
        .frame(width: 320, height: 560)
        .background(Color(.systemBackground))
        .cornerRadius(25)
        .shadow(color: Color(.label), radius: 25)
        .overlay(Button {
            withAnimation {
                isShowingDetailsView = false
            }
        }label: {
            XButtonView()
                .shadow(radius: 10)
        }, alignment: .topTrailing)
        
    }
}

#Preview {
    AppetizerDetilsView(appetizer: MocData.sampleAppetizer, isShowingDetailsView: .constant(false))
}
