//
//  StoreView.swift
//  Groceries
//
//  Created by Saba Gogrichiani on 10.12.23.
//

import SwiftUI

struct StoreView: View {
    
    // MARK: - Properties
    @ObservedObject var viewModel: StoreViewModel
    
    // MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            
            VStack {
                // MARK: Header Section
                HStack {
                    Spacer()
                    
                    CustomTextView(title: "Find Products", fontSize: 20, fontWeight: .bold, fontColor: Color("textColor"))
                    
                    Image("carrot")
                    
                    Spacer()
                }
                
                // MARK: Product List Section
                ScrollView() {
                    LazyVGrid(columns: viewModel.columns, spacing: 15) {
                        ForEach(viewModel.groceryData.productList) { item in
                            ProductCardView(groceryItem: item, viewModel: viewModel)
                                .padding(.bottom, 15)
                        }
                    }
                }
                .scrollIndicators(ScrollIndicatorVisibility.never)
            }
            .padding(.bottom, 90 - geometry.safeAreaInsets.bottom)
            .padding(.horizontal, 24)
        }
    }
}

// MARK: - Preview
#Preview {
    StoreView(viewModel: StoreViewModel(groceryData: SharedGroceryData(productList: GroceryStore.shared.groceryList)))
}

