//
//  StoreViewModel.swift
//  Groceries
//
//  Created by Saba Gogrichiani on 11.12.23.
//

import SwiftUI

class StoreViewModel: ObservableObject {
    
    var productList: [GroceryItem]
    
    init(productList: [GroceryItem]) {
        self.productList = productList
    }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    func addQuantity(groceryItem: GroceryItem) {
        groceryItem.quantity += 1
    }
    
    func decrementQuantity(groceryItem: GroceryItem) {
        groceryItem.quantity -= 1
    }

    
}

