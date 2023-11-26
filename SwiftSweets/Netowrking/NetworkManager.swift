//
//  NetworkManager.swift
//  SwiftSweets
//
//  Created by Connor Hammond on 11/21/23.
//

import Foundation

enum RecipeError: Error {
    case unableToComplete
    case invalidData
    case invalidResponse
    case invalidURL
}

class NetworkManager {
    static let shared = NetworkManager()
    //URL for list of Desserts
    let baseURL = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    
    private init() {}
    
    func getRecipies(completed: @escaping(Result<RecipeListResponse, RecipeError>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
        
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            //TODO: Filter out nil recipies
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let recipies = try decoder.decode(RecipeListResponse.self, from: data)
                DispatchQueue.main.async {
                    completed(.success(recipies))
                }
            } catch {
                completed(.failure(.invalidData))
            }
            
        }
        
        task.resume()
    }
    
    
    func getRecipieDetailsBy(id : String, completed: @escaping(Result<RecipeDetailResponse, RecipeError>) -> Void) {
        let baseURL = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)"
        
        guard let url = URL(string: baseURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
        
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let recipieDetails = try decoder.decode(RecipeDetailResponse.self, from: data)
                DispatchQueue.main.async {
                    completed(.success(recipieDetails))
                }
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
