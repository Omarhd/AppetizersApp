//
//  ContentView.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 12/11/2023.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            CartView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Cart")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
        }
        .accentColor(Color("brandPrimaryColor"))
    }
}

#Preview {
    AppetizerTabView()
}
