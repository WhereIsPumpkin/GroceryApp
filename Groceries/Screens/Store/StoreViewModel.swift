//
//  StoreViewModel.swift
//  Groceries
//
//  Created by Saba Gogrichiani on 11.12.23.
//

import SwiftUI

class StoreViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @ObservedObject var groceryData: SharedGroceryData
    
    // MARK: - Initialization
    
    init(groceryData: SharedGroceryData) {
        self.groceryData = groceryData
    }
    
    // MARK: - Grid Configuration
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // MARK: - Public Methods
    
    func addQuantity(groceryItem: GroceryItem) {
        groceryItem.quantity += 1
    }
    
    func decrementQuantity(groceryItem: GroceryItem) {
        if groceryItem.quantity > 0 {
            groceryItem.quantity -= 1
        }
    }
}
