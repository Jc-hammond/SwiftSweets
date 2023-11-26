//
//  RecipeCellTitle.swift
//  SwiftSweets
//
//  Created by Connor Hammond on 11/26/23.
//

import SwiftUI

struct RecipeCellTitle: View {
    var recipeName: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .clipShape(
                    .rect(
                        topLeadingRadius: 0,
                        bottomLeadingRadius: 15,
                        bottomTrailingRadius: 15,
                        topTrailingRadius: 0
                    )
                )
                .foregroundStyle(.ultraThinMaterial)
                .frame(height: 45)
                .padding(.horizontal)
            Text(recipeName)
                .textCase(.uppercase)
                .font(.custom("PlayfairDisplay-Bold", size: 16))
                .lineLimit(2)
                .minimumScaleFactor(0.75)
                .tint(.white)
                .padding(.horizontal, 20)
                .bold()
            
        }.offset(y: 50)
    }
}

#Preview {
    RecipeCellTitle(recipeName: "Chocolate Brownies")
}
