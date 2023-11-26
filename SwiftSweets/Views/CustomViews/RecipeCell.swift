//
//  RecipeCell.swift
//  SwiftSweets
//
//  Created by Connor Hammond on 11/26/23.
//

import SwiftUI

struct RecipeCell: View {
    var recipe: Recipe
    let placeholderString = "https://fakeimg.pl/800x800/6babff/ffffff?text=No+image"
    var body: some View {
        ZStack {
            //TODO: update how the URL is handled here
            let url = URL(string: recipe.thumbnailUrl ?? placeholderString)
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .clipShape(.rect(cornerRadius: 15))
                
            } placeholder: {
                ZStack {
                    Color.blue.opacity(0.25)
                        .clipShape(.rect(cornerRadius: 15))
                    ProgressView()
                }
            }
            .padding(.horizontal)
            .frame(height: 145)
            
            
            
            RecipeCellTitle(recipeName: recipe.name)
        }
        .padding(.vertical, 5)
        .scrollTransition { content, phase in
            content
                .opacity(phase.isIdentity ? 1 : 0.25)
                .scaleEffect(phase.isIdentity ? 1 : 0.75)
                .blur(radius: phase.isIdentity ? 0 : 10)
        }
    }
}

#Preview {
    RecipeCell(recipe: Recipe(id: "54039", name: "Brownies", thumbnailUrl: ""))
}
