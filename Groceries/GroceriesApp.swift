//
//  GroceriesApp.swift
//  Groceries
//
//  Created by Saba Gogrichiani on 10.12.23.
//

import SwiftUI

@main
struct GroceriesApp: App {
    @State private var groceryStore = GroceryStore()
    
    var body: some Scene {
        WindowGroup {
            MainTabContainerView()
                .environment(groceryStore)
        }
    }
}
