//
//  StoreView.swift
//  Groceries
//
//  Created by Saba Gogrichiani on 10.12.23.
//

import SwiftUI

struct StoreView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        GeometryReader { geometry in
            let bottomSafeArea = geometry.safeAreaInsets.bottom
            
            VStack {
                HStack {
                    Spacer()
                    Text("Find Products")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.15))
                    
                    Image("carrot")
                    Spacer()
                }
                
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: columns, spacing: 15) {
                        ForEach(GroceryStore.groceryList) { item in
                            ProductCardView(groceryItem: .constant(item))
                                .padding(.bottom, 15)
                        }
                    }
                }

                
            }
            .padding(.bottom, 90 - bottomSafeArea)
            .padding(.horizontal, 24)
        }
    }
}

#Preview {
    StoreView()
}

