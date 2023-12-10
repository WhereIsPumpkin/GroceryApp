//
//  CartView.swift
//  Groceries
//
//  Created by Saba Gogrichiani on 10.12.23.
//

import SwiftUI

struct CartView: View {
    
    var productList: [GroceryItem]
    
    var filteredProductList: [GroceryItem] {
        productList.filter { $0.quantity > 0 }
    }
    
    var totalPrice: Double {
        filteredProductList.reduce(0) { $0 + $1.totalItemPrice }
    }
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack(spacing: 32) {
                if filteredProductList.count > 0 {
                    Text("My Cart")
                        .font(.system(size: 20, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.15))
                    
                    VStack {
                        Divider()
                        
                        ScrollView() {
                            ForEach(filteredProductList) { item in
                                CartItemView(groceryItem: item, totalItemPrice: item.totalItemPrice)
                                    .padding(.bottom, 15)
                            }
                        }
                        .scrollIndicators(ScrollIndicatorVisibility.hidden)
                        
                        if(filteredProductList.count > 0 ) {
                            HStack{
                                Spacer()
                                
                                Text("Total Price: $ \(String(format: "%.2f",totalPrice))")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 18, weight: .semibold))
                                    
                                Spacer()
                            }
                            .foregroundColor(.clear)
                            .frame(height: 67)
                            .background(Color(red: 0.33, green: 0.69, blue: 0.46))
                            .cornerRadius(19)
                        }
                            
                    }
                    .padding(.horizontal, 25)
                    .padding(.bottom, 25)
                } else {
                    Spacer()
                    HStack(){
                        Spacer()
                        Image("cart-empty")
                        Spacer()
                    }
                    Text("Your Cart is Empty")
                        .font(.system(size: 25, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.15))
                    Spacer()
                }
            }
            .padding(.bottom, 90 - geometry.safeAreaInsets.bottom)
            
        }
    }
}

#Preview {
    CartView(productList: GroceryStore().groceryList)
}
