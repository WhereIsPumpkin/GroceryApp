//
//  AdjustButton.swift
//  Groceries
//
//  Created by Saba Gogrichiani on 10.12.23.
//

import SwiftUI

struct AdjustButton: View {
    
    // MARK: - Properties
    let minusAction: () -> Void
    let plusAction: () -> Void
    var quantityPlaceholder: Int
    let buttonSize: CGFloat
    let buttonFontSize: CGFloat
    
    // MARK: - Body
    var body: some View {
        HStack {
            Button(action: minusAction, label: {
                Image(systemName: "minus")
                    .frame(width: buttonSize, height: buttonSize)
                    .font(.system(size: buttonFontSize))
                    .background(.clear)
                    .foregroundStyle(Color("mainGreen"))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 0.89, green: 0.89, blue: 0.89))
                    )
            })
            
            Spacer()
            
            Text("\(quantityPlaceholder)")
                .font(.system(size: buttonFontSize, weight: .semibold))
                .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.15))
            
            Spacer()
            
            Button(action: plusAction, label: {
                Image(systemName: "plus")
                    .frame(width: buttonSize, height: buttonSize)
                    .font(.system(size: buttonFontSize))
                    .background(.clear)
                    .foregroundStyle(Color("mainGreen"))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 0.89, green: 0.89, blue: 0.89))
                    )
            })
        }
    }
}


#Preview {
    AdjustButton(minusAction: {print("Hey")}, plusAction: {
        print("Hey")
    }, quantityPlaceholder: 0, buttonSize: 44, buttonFontSize: 18)
}
