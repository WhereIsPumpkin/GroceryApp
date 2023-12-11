//
//  CartViewModel.swift
//  Groceries
//
//  Created by Saba Gogrichiani on 10.12.23.
//

import SwiftUI

class CartViewModel: ObservableObject {
    
    @ObservedObject var groceryData: SharedGroceryData
    
    init(groceryData: SharedGroceryData) {
        self.groceryData = groceryData
    }
    
    var filteredProductList: [GroceryItem] {
        groceryData.productList.filter { $0.quantity > 0 }
    }
    
    var totalPrice: Double {
        filteredProductList.reduce(0) { $0 + $1.totalItemPrice }
    }
    
}



