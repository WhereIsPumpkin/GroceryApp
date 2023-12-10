//
//  CartView.swift
//  Groceries
//
//  Created by Saba Gogrichiani on 10.12.23.
//

import SwiftUI

struct CartView: View {
    
    // MARK: - Properties
    @ObservedObject var viewModel: CartViewModel
    
    // MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            
            VStack(spacing: 32) {
                // MARK: Cart Items Section
                
                if viewModel.filteredProductList.count > 0 {
                    Text("My Cart")
                        .font(.system(size: 20, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.15))
                    
                    VStack {
                        Divider()
                        
                        ScrollView() {
                            ForEach(viewModel.filteredProductList) { item in
                                CartItemView(groceryItem: item, totalItemPrice: item.totalItemPrice)
                                    .padding(.bottom, 15)
                            }
                        }
                        .scrollIndicators(ScrollIndicatorVisibility.hidden)
                        
                        // MARK: Total Price Section
                        if(viewModel.filteredProductList.count > 0 ) {
                            HStack{
                                Spacer()
                                
                                Text("Total Price: $ \(String(format: "%.2f",viewModel.totalPrice))")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 18, weight: .semibold))
                                
                                Spacer()
                            }
                            .foregroundColor(.clear)
                            .frame(height: 67)
                            .background(Color("mainGreen"))
                            .cornerRadius(19)
                        }
                    }
                    .padding(.horizontal, 25)
                    .padding(.bottom, 25)
                    
                } else {
                    // MARK: Empty Cart Section
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

// MARK: - Preview
#Preview {
    CartView(viewModel: CartViewModel(productList: GroceryStore().groceryList))
}
