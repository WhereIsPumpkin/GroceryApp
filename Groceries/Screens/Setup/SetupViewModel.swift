//
//  SetupViewModel.swift
//  Groceries
//
//  Created by Saba Gogrichiani on 11.12.23.
//

import SwiftUI

class SetupViewModel: ObservableObject {
    @Published var originalPrices: [Int: Double] = [:]
    var productList: [GroceryItem] = []
    
    init(productList: [GroceryItem]) {
        self.productList = productList
    }
    
    func adjustPrices(by percentage: Double) {
        for index in productList.indices {
            if let oldPrice = originalPrices[index] {
                productList[index].price = oldPrice * (1 - percentage/100)
            } else {
                originalPrices[index] = productList[index].price
                productList[index].price *= (1 - percentage/100)
            }
        }
    }
    
    func removeAllProducts() {
        productList.removeAll()
    }
}



