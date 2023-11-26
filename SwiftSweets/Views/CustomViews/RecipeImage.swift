//
//  RecipeImage.swift
//  SwiftSweets
//
//  Created by Connor Hammond on 11/26/23.
//

import SwiftUI

struct RecipeImage: View {
    var url: URL?
    
    var body: some View {
        VStack {
            AsyncImage(url: url) { image in
                image
                    .image?.resizable()
                    .aspectRatio(contentMode: .fill)
                    .mask(LinearGradient(gradient: Gradient(stops: [
                        .init(color: .black, location: 0),
                        .init(color: .clear, location: 1),
                        .init(color: .black, location: 1),
                    ]), startPoint: .top, endPoint: .bottom))
                    .padding(.top, 30)
            }
            .frame(height: 250)
        }
    }
}

#Preview {
    RecipeImage()
}
