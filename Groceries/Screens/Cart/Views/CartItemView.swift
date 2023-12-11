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
                    CustomTextView(title: groceryItem.name, fontSize: 16, fontWeight: .bold, fontColor: Color("textColor"))
                    
                    CustomTextView(title: "\(groceryItem.amount), Price", fontSize: 14, fontWeight: .regular, fontColor: Color(red: 0.49, green: 0.49, blue: 0.49))
                    
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
                        
                        CustomTextView(title: "$\(String(format: "%.2f", totalItemPrice))", fontSize: 18, fontWeight: .semibold, fontColor: Color("textColor"))
                        
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

