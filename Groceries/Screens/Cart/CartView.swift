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
                    CustomTextView(title: "My Cart", fontSize: 20, fontWeight: .bold, fontColor: Color("textColor"))
                    
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
                                
                                CustomTextView(title: "Total Price: $ \(String(format: "%.2f", viewModel.totalPrice))", fontSize: 18, fontWeight: .semibold, fontColor: Color.white)
                                
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
                    
                    CustomTextView(title: "Your Cart is Empty", fontSize: 25, fontWeight: .bold, fontColor: Color("textColor"))
                    
                    Spacer()
                }
            }
            .padding(.bottom, 90 - geometry.safeAreaInsets.bottom)
        }
    }
}

// MARK: - Preview
#Preview {
    SetupView(viewModel: SetupViewModel(groceryData: SharedGroceryData(productList: GroceryStore.shared.groceryList)))
}
