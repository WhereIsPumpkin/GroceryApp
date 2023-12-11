//
//  SetupViewModel.swift
//  Groceries
//
//  Created by Saba Gogrichiani on 11.12.23.
//

import SwiftUI

class SetupViewModel: ObservableObject {
    
    @Published var originalPrices: [Int: Double] = [:]
    @ObservedObject var groceryData: SharedGroceryData
    
    init(groceryData: SharedGroceryData) {
        self.groceryData = groceryData
    }
    
    func adjustPrices(by percentage: Double) {
        for index in groceryData.productList.indices {
            if let oldPrice = originalPrices[index] {
                groceryData.productList[index].price = oldPrice * (1 - percentage/100)
            } else {
                originalPrices[index] = groceryData.productList[index].price
                groceryData.productList[index].price *= (1 - percentage/100)
            }
        }
    }
    
    func removeAllProducts() {
        groceryData.productList.removeAll()
    }
}



