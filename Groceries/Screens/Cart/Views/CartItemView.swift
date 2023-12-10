//
//  CartProductView.swift
//  Groceries
//
//  Created by Saba Gogrichiani on 10.12.23.
//

import SwiftUI

struct CartItemView: View {
    
    @Bindable var groceryItem: GroceryItem
    
    var totalItemPrice: Double
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack(alignment: .center) {
                Image(groceryItem.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 106, maxHeight: 93)
                
                Spacer(minLength: 22)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(groceryItem.name)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.15))
                    
                    Text("\(groceryItem.amount), Price")
                        .font(.system(size: 14))
                        .foregroundColor(Color(red: 0.49, green: 0.49, blue: 0.49))
                    
                    Spacer(minLength: 8)
                    
                    AdjustButton(minusAction: {
                        groceryItem.quantity -= 1
                    }, plusAction: {
                        groceryItem.quantity += 1
                    }, quantityPlaceholder: groceryItem.quantity,
                                 buttonSize: 34,
                                 buttonFontSize: 15)
                    .frame(width: 110)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Button(action: {
                        groceryItem.quantity = 0
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(Color(red: 0.7, green: 0.7, blue: 0.7))
                            .font(.system(size: 15))
                    })
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Text("$\(String(format: "%.2f", totalItemPrice))")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.15))
                    }
                    .frame(width: 100)
                    
                    
                }
            }
            .padding(.vertical, 30)
            
            Divider()
            
        }
        .frame(height: 155)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CartItemView(groceryItem: GroceryStore().groceryList[0], totalItemPrice: 999.99)
}

