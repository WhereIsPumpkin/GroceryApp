//
//  ProductCardView.swift
//  Groceries
//
//  Created by Saba Gogrichiani on 10.12.23.
//

import SwiftUI

typealias groceryItem = GroceryStore.GroceryItem

struct ProductCardView: View {
    
    @Binding var groceryItem: groceryItem
    
    var body: some View {
        VStack {
            Image(groceryItem.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 115, maxHeight: 100)
            
            
            Spacer(minLength: 25)
            
            HStack {
                VStack(alignment: .leading, spacing: 12) {
                    Text(groceryItem.name)
                        .font(.system(size: 16, weight: .bold))
                        .kerning(0.1)
                        .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.15))
                    
                    Text("\(groceryItem.amount), Price")
                        .font(.system(size: 14))
                        .foregroundColor(Color(red: 0.49, green: 0.49, blue: 0.49))
                }
                Spacer()
            }
            
            Spacer()
            
            HStack {
                if groceryItem.quantity < 1 {
                    Text("$\(String(format: "%.2f", groceryItem.price))")
                        .font(.system(size: 18, weight: .semibold))
                        .kerning(0.1)
                        .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.15))
                    
                    Spacer()
                }
                
                
                if groceryItem.quantity > 0 {
                    AdjustButton(minusAction: {
                        print("- quantity")
                    }, plusAction: {
                        print("+ quantity")
                    }, quantityPlaceholder: 1)
                } else {
                    AddButton(action: {
                        print("added")
                    })
                }
            }
            .frame(height: 45)
        }
        .frame(maxWidth: 175, maxHeight: 230)
        .padding(EdgeInsets(top: 20, leading: 15, bottom: 15, trailing: 15))
        .shadow(color: .black.opacity(0), radius: 6, x: 0, y: 6)
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .inset(by: 0.5)
                .stroke(Color(red: 0.89, green: 0.89, blue: 0.89), lineWidth: 1)
        )
        
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ProductCardView(groceryItem: .constant(GroceryStore.groceryList[0]))
        .padding()
}
