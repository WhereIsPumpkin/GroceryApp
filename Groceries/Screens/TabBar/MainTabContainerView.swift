//
//  ContentView.swift
//  Groceries
//
//  Created by Saba Gogrichiani on 10.12.23.
//

import SwiftUI

struct MainTabContainerView: View {
    @State private var tabSelected: Tab = .storefront
    
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
                                StoreView()
                            case .cart:
                                CartView()
                            case .setup:
                                SetupView()
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


#Preview {
    MainTabContainerView()
}
