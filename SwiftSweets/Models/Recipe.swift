//
//  Recipie.swift
//  SwiftSweets
//
//  Created by Connor Hammond on 11/21/23.
//

import Foundation

// Main structure for the recipe list response
struct RecipeListResponse: Codable {
    let meals: [Recipe]
}

// Represents a single recipe
struct Recipe: Codable, Identifiable {
    let id: String
    let name: String
    let thumbnailUrl: String?

    // Coding keys to map JSON data to properties
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnailUrl = "strMealThumb"
    }
}
