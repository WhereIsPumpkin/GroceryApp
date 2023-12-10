//
//  CustomButtonView.swift
//  Groceries
//
//  Created by Saba Gogrichiani on 11.12.23.
//

import SwiftUI

struct CustomButtonView: View {
    
    // MARK: - Properties
    var action: () -> Void
    var buttonText: String
    var backgroundColor: Color

    // MARK: - Body
    var body: some View {
        Button(action: action, label: {
            Text(buttonText)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, minHeight: 67)
                .background(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        })
    }
}

#Preview {
    CustomButtonView(action: {
        print("test")
    }, buttonText: "Test", backgroundColor: Color(.green))
}
