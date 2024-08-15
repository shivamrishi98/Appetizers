//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Shivam Rishi on 8/8/2024.
//

import SwiftUI

struct AppetizerListCell: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
            // Con is that it does not cache image
//            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
//                image
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 120,height: 90)
//                    .cornerRadius(8)
//            } placeholder: {
//                Image("food-placeholder")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 120,height: 90)
//                    .cornerRadius(8)
//            }
            
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120,height: 90)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(appetizer.price, specifier: "%.2 f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}
