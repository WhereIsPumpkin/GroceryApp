//
//  SetupView.swift
//  Groceries
//
//  Created by Saba Gogrichiani on 10.12.23.
//

import SwiftUI

struct SetupView: View {
    
    // MARK: - Properties
    @State private var showSaleModal = false
    @State private var percentage: Double = 0
    @ObservedObject var viewModel: SetupViewModel
    
    // MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            VStack {
                CustomTextView(title: "Setup", fontSize: 20, fontWeight: .bold, fontColor: Color("textColor"))
                
                CustomButtonView(action: {
                    showSaleModal = true
                }, buttonText: "Set Sale", backgroundColor: Color(red: 0.33, green: 0.69, blue: 0.46))
                
                CustomButtonView(action: {
                    // in development
                }, buttonText: "Delete Product", backgroundColor: Color(red: 0.70, green: 0.32, blue: 0.45))
            }
            .padding(.horizontal, 25)
            .padding(.bottom, 90 - geometry.safeAreaInsets.bottom)
            .sheet(isPresented: $showSaleModal) {
                SaleModalView(showModal: $showSaleModal, percentage: $percentage, viewModel: viewModel)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    SetupView(viewModel: SetupViewModel(productList: GroceryStore().groceryList))
}
