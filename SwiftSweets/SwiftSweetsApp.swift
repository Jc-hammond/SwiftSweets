//
//  SwiftSweetsApp.swift
//  SwiftSweets
//
//  Created by Connor Hammond on 11/21/23.
//

import SwiftUI

@main
struct SwiftSweetsApp: App {
    
    init() {
        let appearance = UINavigationBarAppearance()
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "PlayfairDisplay-Bold", size: 32) ?? UIFont.systemFont(ofSize: 32)
        ]

        appearance.largeTitleTextAttributes = attributes
        appearance.titleTextAttributes = attributes

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some Scene {
        WindowGroup {
            RecipesListView()
        }
    }
}
