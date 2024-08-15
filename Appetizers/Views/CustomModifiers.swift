//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Shivam Rishi on 14/8/2024.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}

