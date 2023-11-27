//
//  ContentView.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 12/11/2023.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var order: CartViewModel
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem { Label("Home", systemImage: "house") }
            
            CartView()
                .tabItem { Label("Cart", systemImage: "bag") }
                .badge(order.orders.count)

            UserView()
                .tabItem { Label("Profile", systemImage: "person") }
        }
    }
}

#Preview {
    AppetizerTabView()
}
