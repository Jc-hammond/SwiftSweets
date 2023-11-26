//
//  RecipieDetailView.swift
//  SwiftSweets
//
//  Created by Connor Hammond on 11/22/23.
//

import SwiftUI

struct RecipeDetailView: View {
    @ObservedObject var viewModel = RecipeDetailViewModel()
    
    var recipeId: String
    var imageString: String?
    
    var body: some View {
        VStack {
            let url = URL(string: imageString ?? viewModel.placeholderString)
            
            RecipeImage(url: url)
            
            ZStack {
                Color.gray.opacity(0.25)
                    .mask(LinearGradient(gradient: Gradient(stops: [
                        .init(color: .black, location: 0),
                        .init(color: .clear, location: 1),
                        .init(color: .black, location: 1),
                    ]), startPoint: .bottom, endPoint: .top))
                    .ignoresSafeArea()
                
                InstructionsView(viewModel: viewModel)
            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: {
            viewModel.getRecipeDetails(for: recipeId)
        })
        .onDisappear(perform: {
            viewModel.selection = .instructions
        })
    }
}


#Preview {
    RecipeDetailView(recipeId: "53049")
}

