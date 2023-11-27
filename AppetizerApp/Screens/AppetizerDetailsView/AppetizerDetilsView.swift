//
//  AppetizerDetilsView.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 12/11/2023.
//

import SwiftUI

struct AppetizerDetilsView: View {
    
    @EnvironmentObject var order: CartViewModel
        
        let appetizer: Appetizer
        @Binding var isShowingDetail: Bool
        
        var body: some View {
            VStack {
                AppetizerRemoteImageLoader(urlString: appetizer.imageURL)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 225)
                
                VStack {
                    Text(appetizer.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(appetizer.description)
                        .multilineTextAlignment(.center)
                        .font(.body)
                        .padding()
                    
                    HStack(spacing: 40) {
                        NutritionView(title: "Calories", value: "\(appetizer.calories)")
                        NutritionView(title: "Carbs", value: "\(appetizer.carbs) g")
                        NutritionView(title: "Protein", value: "\(appetizer.protein) g")
                    }
                }
                
                Spacer()
                
                Button {
                    order.add(appetizer)
                    isShowingDetail = false
                } label: {
    //                APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to Order")
                    Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
                }
                .modifier(StandardButtonStyle())
//                .standardButtonStyle()
//                .standardButtonStyle()
//                .buttonStyle(.bordered)
//                .tint(.accentColor)
//                .controlSize(.large)
                .padding(.bottom, 30)
            }
            .frame(width: 300, height: 525)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 40)
            .overlay(Button {
                isShowingDetail = false
            } label: {
                XDismissButton()
            }, alignment: .topTrailing)
        }
}

#Preview {
    AppetizerDetilsView(appetizer: MocData.sampleAppetizer, isShowingDetail: .constant(false))
}
