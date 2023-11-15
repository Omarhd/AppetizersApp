//
//  AppetizerSkeletonView.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 12/11/2023.
//

import SwiftUI

struct AppetizerSkeletonView: View {
    
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 80, height: 80)
                .foregroundColor(Color.gray.opacity(0.5))
                .scaleEffect(scale)
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                        self.scale = 0.7
                    }
                }
            
            VStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 120, height: 12)
                    .foregroundColor(Color.gray.opacity(0.5))
                
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 180, height: 12)
                    .foregroundColor(Color.gray.opacity(0.5))
            }
        }
        .opacity(0.7) // Adjust the opacity as needed
    }
}

#Preview {
    AppetizerSkeletonView()
}
