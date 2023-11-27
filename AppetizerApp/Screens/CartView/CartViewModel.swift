//
//  CartViewModel.swift
//  AppetizerApp
//
//  Created by Omar Abdulrahman on 12/11/2023.
//

import SwiftUI

final class CartViewModel: ObservableObject {
 
    @Published var orders: [Appetizer] = []
    
    var totalPrice: Double {
        orders.reduce(0) { $0 + $1.price }
    }
    
    func add(_ appetizer: Appetizer) {
        orders.append(appetizer)
    }
    
    func deleteItem(at offSet: IndexSet) {
        orders.remove(atOffsets: offSet)
    }

}
