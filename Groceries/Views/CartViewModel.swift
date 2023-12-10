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
    
    func foo() {
        print(productList.count)
    }
    
    var filteredProductList: [GroceryItem] {
        productList.filter { $0.quantity > 0 }
    }
    
    func itemTotalPrice(for item: GroceryItem) -> Double {
        item.price * Double(item.quantity)
    }
}

