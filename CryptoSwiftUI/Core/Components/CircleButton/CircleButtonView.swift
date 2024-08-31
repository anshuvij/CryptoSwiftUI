//
//  CircleButtonView.swift
//  CryptoSwiftUI
//
//  Created by Anshu.Vij on 26/08/24.
//

import SwiftUI

struct CircleButtonView: View {
    
    let iconName : String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundStyle(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundStyle(Color.theme.background)
            )
            .shadow(
                color: Color.theme.accent.opacity(0.25),
                radius: 10,
                x: 0,
                y: 0
            )
            .padding()
        
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    
    CircleButtonView(iconName: "info")
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.light)
}
#Preview(traits: .sizeThatFitsLayout) {
    CircleButtonView(iconName: "plus")
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }

