//
//  StoreViewModel.swift
//  Groceries
//
//  Created by Saba Gogrichiani on 11.12.23.
//

import SwiftUI

class StoreViewModel: ObservableObject {
  @ObservedObject var groceryData: SharedGroceryData
  
  init(groceryData: SharedGroceryData) {
      self.groceryData = groceryData
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


