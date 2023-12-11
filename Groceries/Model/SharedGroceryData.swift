//
//  SharedGroceryData.swift
//  Groceries
//
//  Created by Saba Gogrichiani on 11.12.23.
//

import Foundation

class SharedGroceryData: ObservableObject {
    @Published var productList: [GroceryItem]
    
    init(productList: [GroceryItem]) {
        self.productList = productList
    }
}

