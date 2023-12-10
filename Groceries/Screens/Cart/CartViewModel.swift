//
//  CartViewModel.swift
//  Groceries
//
//  Created by Saba Gogrichiani on 10.12.23.
//

import Foundation

class CartViewModel: ObservableObject {
    
    var productList: [GroceryItem]
    
    init(productList: [GroceryItem]) {
        self.productList = productList
    }
    
    var filteredProductList: [GroceryItem] {
        productList.filter { $0.quantity > 0 }
    }
    
    var totalPrice: Double {
        filteredProductList.reduce(0) { $0 + $1.totalItemPrice }
    }
    
}



