//
//  CartViewModel.swift
//  Groceries
//
//  Created by Saba Gogrichiani on 10.12.23.
//

import SwiftUI

class CartViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @ObservedObject var groceryData: SharedGroceryData
    
    // MARK: - Initialization
    
    init(groceryData: SharedGroceryData) {
        self.groceryData = groceryData
    }
    
    // MARK: - Computed Properties
    
    var filteredProductList: [GroceryItem] {
        groceryData.productList.filter { $0.quantity > 0 }
    }
    
    var totalPrice: Double {
        filteredProductList.reduce(0) { $0 + $1.totalItemPrice }
    }
}
