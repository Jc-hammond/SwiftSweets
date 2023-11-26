//
//  RecipieDetailViewModel.swift
//  SwiftSweets
//
//  Created by Connor Hammond on 11/22/23.
//

import Foundation

class RecipeDetailViewModel: ObservableObject {
    @Published var recipeDetails: RecipeDetail?
    @Published var selection = TabSelection.instructions
    
    let placeholderString = "https://fakeimg.pl/800x800/6babff/ffffff?text=No+image"

    var displayName: String {
            recipeDetails?.name ?? "No Recipe To Display"
        }
    
    var ingredientMeasurements: [(ingredient: String, measurement: String)] {
        guard let detail = recipeDetails else { return [] }

        let mirror = Mirror(reflecting: detail)
        var pairs: [(String, String)] = []

        for i in 1...20 {
            if let ingredient = mirror.descendant("ingredient\(i)") as? String,
               let measurement = mirror.descendant("measurement\(i)") as? String,
               !ingredient.trimmingCharacters(in: .whitespaces).isEmpty {
                pairs.append((ingredient, measurement))
            }
        }
        return pairs
    }
        
    func getRecipeDetails(for recipeID: String) {
        NetworkManager.shared.getRecipieDetailsBy(id: recipeID) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let recipeDetails):
                    self.recipeDetails = recipeDetails.meals.first
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
