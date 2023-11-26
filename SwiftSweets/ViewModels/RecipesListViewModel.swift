//
//  RecipiesListViewModel.swift
//  SwiftSweets
//
//  Created by Connor Hammond on 11/21/23.
//

import Foundation

class RecipiesListViewModel: ObservableObject {
    @Published var recipies: [Recipe] = []
    
    @Published var searchText = ""
    
    var searchResults: [Recipe] {
            if searchText.isEmpty {
                return recipies.sorted { $0.name < $1.name }
            } else {
                return recipies.filter { $0.name.localizedCaseInsensitiveContains(searchText) }.sorted { $0.name < $1.name }
            }
        }
    
    func fetchRecipies() {
        NetworkManager.shared.getRecipies { result in
            switch result {
            case .success(let recipeResponse):
                self.recipies = recipeResponse.meals
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
