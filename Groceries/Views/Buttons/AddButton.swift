//
//  AddButton.swift
//  Groceries
//
//  Created by Saba Gogrichiani on 10.12.23.
//

import SwiftUI

struct AddButton: View {
    
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Image(systemName: "plus")
                .frame(width: 44, height: 44)
                .background(Color(red: 0.33, green: 0.69, blue: 0.46))
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
        })
    }
    
}


#Preview {
    AddButton(action: {
        print("hey")
    })
}
