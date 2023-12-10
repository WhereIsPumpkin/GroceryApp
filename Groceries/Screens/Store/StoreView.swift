//
//  StoreView.swift
//  Groceries
//
//  Created by Saba Gogrichiani on 10.12.23.
//

import SwiftUI

struct StoreView: View {
    
    var productList: [GroceryItem]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack {
                HStack {
                    Spacer()
                    Text("Find Products")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.15))
                    
                    Image("carrot")
                    Spacer()
                }
                
                ScrollView() {
                    LazyVGrid(columns: columns, spacing: 15) {
                        ForEach(productList) { item in
                            ProductCardView(groceryItem: item)
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

#Preview {
    StoreView(productList: GroceryStore().groceryList)
}

