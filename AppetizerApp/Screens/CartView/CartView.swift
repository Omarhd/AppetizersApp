//
//  CartView.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 12/11/2023.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var order: CartViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.orders) { appetizer in
                            AppetizerCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItem)
                    }
                    .listStyle(.plain)
                    
                    Button {
                        
                    } label: {
//                        PrimaryButtonView(title: "$\(order.totalPrice, specifier: "%.2f") - Place Order")
                        Text("$\(order.totalPrice, specifier: "%.2f") - Confirm")
                    }
                    .frame(width: 260, height: 50)
                    .modifier(StandardButtonStyle())
                    .padding(.bottom, 30)
                }
                if order.orders.isEmpty {
                    EmptyState(imageName: "handbag.circle", message: "yoy don't have any items yet \n please add some items first")
                }
            }
            .navigationTitle("🧾 Cart")
        }
    }    
}

#Preview {
    CartView()
}
