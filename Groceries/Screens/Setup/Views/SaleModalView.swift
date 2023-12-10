//
//  SaleModalView.swift
//  Groceries
//
//  Created by Saba Gogrichiani on 11.12.23.
//

import SwiftUI

struct SaleModalView: View {
    
    // MARK: - Properties
    @Binding var showModal: Bool
    @Binding var percentage: Double
    @ObservedObject var viewModel: SetupViewModel
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 40) {
            Text("Set Sale Amount")
                .font(.system(size: 30, weight: .semibold))
                .foregroundStyle(Color("mainGreen"))
            
            Slider(value: $percentage, in: 0...100, step: 1)
            
            Text("\(Int(percentage))%")
                .font(.system(size: 25, weight: .bold))
                .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.15))
            
            Button(action: {
                viewModel.adjustPrices(by: percentage)
                showModal.toggle()
            }, label: {
                Text("Save")
                    .frame(width: UIScreen.main.bounds.width - 32, height: 67)
                    .background(Color("mainGreen"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
        }
        .padding()
        .presentationDetents([.medium])
    }
}

// MARK: - Preview

#Preview {
    SaleModalView(showModal: .constant(true), percentage: .constant(0), viewModel: SetupViewModel(productList: GroceryStore().groceryList))
}
