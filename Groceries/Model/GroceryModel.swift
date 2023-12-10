//
//  File.swift
//  Groceries
//
//  Created by Saba Gogrichiani on 10.12.23.
//

import Foundation

@Observable
class GroceryItem: Identifiable {
    let id: UUID
    let name: String
    let amount: String
    var price: Double
    var quantity: Int
    var totalItemPrice: Double {
        price * Double(quantity)
    }
    let image: String
    
    init(name: String, amount: String, price: Double, quantity: Int, image: String) {
        self.id = UUID()
        self.name = name
        self.amount = amount
        self.price = price
        self.quantity = quantity
        self.image = image
    }
}

@Observable
class GroceryStore {
    var groceryList: [GroceryItem] = [
        GroceryItem(name: "Diet Coke", amount: "325ml", price: 1.99, quantity: 0, image: "dietCoke"),
        GroceryItem(name: "Red Apple", amount: "1kg", price: 4.99, quantity: 0, image: "apple"),
        GroceryItem(name: "Apple Juice", amount: "2L", price: 15.99, quantity: 0, image: "appleJuice"),
        GroceryItem(name: "Banana", amount: "7pcs", price: 4.99, quantity: 0, image: "banana"),
        GroceryItem(name: "Beef Bone", amount: "1kg", price: 4.99, quantity: 0, image: "beef"),
        GroceryItem(name: "Broiler Chicken", amount: "1kg", price: 4.99, quantity: 0, image: "chicken"),
        GroceryItem(name: "Egg", amount: "4pcs", price: 1.99, quantity: 0, image: "egg"),
        GroceryItem(name: "Ginger", amount: "100g", price: 4.99, quantity: 0, image: "ginger"),
        GroceryItem(name: "Pepper", amount: "50g", price: 4.99, quantity: 0, image: "pepper"),
        GroceryItem(name: "Mayonnaise", amount: "200g", price: 3.99, quantity: 0, image: "mayonnais"),
        GroceryItem(name: "Orange Juice", amount: "2L", price: 15.99, quantity: 0, image: "orangeJuice"),
    ]
}




