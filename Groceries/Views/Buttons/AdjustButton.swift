//
//  AdjustButton.swift
//  Groceries
//
//  Created by Saba Gogrichiani on 10.12.23.
//

import SwiftUI

struct AdjustButton: View {
    
    let minusAction: () -> Void
    let plusAction: () -> Void
    var quantityPlaceholder: Int
    
    var body: some View {
        HStack {
            Button(action: minusAction, label: {
                Image(systemName: "minus")
                    .frame(width: 44, height: 44)
                    .font(.system(size: 18))
                    .background(.clear)
                    .foregroundStyle(Color(red: 0.33, green: 0.69, blue: 0.46))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 0.89, green: 0.89, blue: 0.89))
                    )
            })
            
            Text("\(quantityPlaceholder)")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.15))
            
            Button(action: plusAction, label: {
                Image(systemName: "plus")
                    .frame(width: 44, height: 44)
                    .font(.system(size: 18))
                    .background(.clear)
                    .foregroundStyle(Color(red: 0.33, green: 0.69, blue: 0.46))
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
    }, quantityPlaceholder: 0)
}
