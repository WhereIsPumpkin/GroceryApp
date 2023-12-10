//
//  ContentView.swift
//  Groceries
//
//  Created by Saba Gogrichiani on 10.12.23.
//

import SwiftUI

struct MainTabContainerView: View {
    
    @State private var tabSelected: Tab = .storefront
    
    @Environment(GroceryStore.self) private var groceryStore
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $tabSelected) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        VStack {
                            switch tab {
                            case .storefront:
                                StoreView(viewModel: StoreViewModel(productList: groceryStore.groceryList))
                            case .cart:
                                CartView(viewModel: CartViewModel(productList: groceryStore.groceryList))
                            case .setup:
                                SetupView(viewModel: SetupViewModel(productList: groceryStore.groceryList))
                            }
                        }
                        .tag(tab)
                    }
                }
            }
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $tabSelected)
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

