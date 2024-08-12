//
//  APButton.swift
//  Appetizers
//
//  Created by Shivam Rishi on 12/8/2024.
//

import SwiftUI

struct APButton: View {
    
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundStyle(.white)
            .background(Color(.brandPrimary))
            .cornerRadius(10)
    }
}

#Preview {
    APButton(title: "Test Title")
}
