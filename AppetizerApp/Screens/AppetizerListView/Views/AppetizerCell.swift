//
//  AppetizerCell.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 12/11/2023.
//

import SwiftUI

struct AppetizerCell: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        HStack(spacing: 12) {
//            AppetizerRemoteImageLoader(urlString: appetizer.imageURL)
//                .scaledToFit()
//                .frame(width: 120, height: 90)
//                .cornerRadius(12)
            
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 90)
                    .cornerRadius(12)

            } placeholder: {
                Image("food-place-holder")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 90)
                    .cornerRadius(12)
            }

           
            VStack(alignment: .leading, spacing: 12) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(.label))
                
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .fontWeight(.semibold)
                    .foregroundColor(Color(.gray))
            }
            .padding()
        }
    }
}

#Preview {
    AppetizerCell(appetizer: MocData.sampleAppetizer)
        .previewLayout(.sizeThatFits)
}
