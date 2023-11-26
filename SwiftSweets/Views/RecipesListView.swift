//
//  RecipiesListView.swift
//  SwiftSweets
//
//  Created by Connor Hammond on 11/21/23.
//

import SwiftUI

struct RecipesListView: View {
    @ObservedObject var viewModel = RecipiesListViewModel()
    
    var body: some View {
         NavigationStack {
             ZStack {
                 Color(.secondarySystemBackground).ignoresSafeArea()
                 ScrollView {
                     LazyVGrid(columns: [GridItem(), GridItem()]) {
                         ForEach(viewModel.searchResults) { recipe in
                             NavigationLink(destination: RecipeDetailView(recipeId: recipe.id, imageString: recipe.thumbnailUrl)) {
                                 RecipeCell(recipe: recipe)
                             }
                         }
                     }
                     .navigationTitle("Desserts")
                     .font(.custom("PlayfairDisplay-Bold", size: 16))
                     .refreshable {
                         viewModel.fetchRecipies()
                     }
                 }
             }
         }
         .searchable(text: $viewModel.searchText)
         .onAppear(perform: viewModel.fetchRecipies)
     }
}

#Preview {
    RecipesListView()
}
