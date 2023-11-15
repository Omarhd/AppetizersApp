//
//  XButtonView.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 12/11/2023.
//

import SwiftUI

struct XButtonView: View {
    var body: some View {
        Image(systemName: "xmark.circle.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .tint(.pink)
            .frame(width: 25, height: 25)
            .padding(.top, 12)
            .padding(.trailing, 12)
            .opacity(0.8)
    }
}

#Preview {
    XButtonView()
}
