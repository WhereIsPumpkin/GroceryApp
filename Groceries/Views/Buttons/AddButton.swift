//
//  AddButton.swift
//  Groceries
//
//  Created by Saba Gogrichiani on 10.12.23.
//

import SwiftUI

struct AddButton: View {
    
    // MARK: - Properties
    var action: () -> Void
    
    // MARK: - Body
    var body: some View {
        Button(action: action, label: {
            Image(systemName: "plus")
                .frame(width: 44, height: 44)
                .background(Color("mainGreen"))
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
