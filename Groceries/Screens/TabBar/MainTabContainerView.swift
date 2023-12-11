//
//  ContentView.swift
//  Groceries
//
//  Created by Saba Gogrichiani on 10.12.23.
//

import SwiftUI

struct MainTabContainerView: View {
  @State private var tabSelected: Tab = .storefront
  @ObservedObject var groceryData: SharedGroceryData

  init() {
      UITabBar.appearance().isHidden = true
      self.groceryData = SharedGroceryData(productList: GroceryStore.shared.groceryList)
  }

  var body: some View {
      ZStack {
          VStack {
              TabView(selection: $tabSelected) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    VStack {
                        switch tab {
                        case .storefront:
                            StoreView(viewModel: StoreViewModel(groceryData: groceryData))
                        case .cart:
                            CartView(viewModel: CartViewModel(groceryData: groceryData))
                        case .setup:
                            SetupView(viewModel: SetupViewModel(groceryData: groceryData))
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



