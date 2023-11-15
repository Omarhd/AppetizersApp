//
//  QRCodeButton.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 15/11/2023.
//

import SwiftUI

struct QRCodeButton: View {
    var body: some View {
        Image(systemName: "qrcode.viewfinder")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .tint(.brandPrimary)
            .frame(width: 40, height: 40)
            .padding(.top, 12)
            .padding(.leading)
            .opacity(0.8)
    }
}

#Preview {
    QRCodeButton()
}
