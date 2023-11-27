//
//  StandardButtonStyle.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 22/11/2023.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.accentColor)
            .controlSize(.large)
    }
}

extension View {
    func standardButtonStyle() -> some View {
        self.modifier(StandardButtonStyle())
    }
}

//#Preview {
//    StandardButtonStyle()
//}
