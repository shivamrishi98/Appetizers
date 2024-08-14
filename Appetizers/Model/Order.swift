//
//  Order.swift
//  Appetizers
//
//  Created by Shivam Rishi on 14/8/2024.
//

import SwiftUI

final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    @Published var alertItem: AlertItem?
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    func placeOrder() {
        alertItem = AlertContext.orderPlaced
        items.removeAll()
    }
    
}

