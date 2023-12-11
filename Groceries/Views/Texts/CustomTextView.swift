//
//  CustomTextView.swift
//  Groceries
//
//  Created by Saba Gogrichiani on 11.12.23.
//

import SwiftUI

struct CustomTextView: View {
    
    var title: String
    var fontSize: CGFloat
    var fontWeight: Font.Weight
    var fontColor: Color
    
    var body: some View {
        Text(title)
            .font(.system(size: fontSize, weight: fontWeight))
            .foregroundColor(fontColor)
    }
}
#Preview {
    CustomTextView(title: "Test", fontSize: 20, fontWeight: .semibold, fontColor: .blue)
}
