//
//  AppetizerAppApp.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 12/11/2023.
//

import SwiftUI

@main
struct AppetizerAppApp: App {
    
    var order = CartViewModel()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
