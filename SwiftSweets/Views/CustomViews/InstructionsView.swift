//
//  InstructionsView.swift
//  SwiftSweets
//
//  Created by Connor Hammond on 11/26/23.
//

import SwiftUI

struct InstructionsView: View {
    @ObservedObject var viewModel: RecipeDetailViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.displayName)
                .font(.custom("PlayfairDisplay-Bold", size: 26))
                .bold()
                .textCase(.uppercase)
                .multilineTextAlignment(.center)
                .padding(.top)
            
            SegmentedControl(tabSelection: $viewModel.selection)
            
            ScrollView {
                if viewModel.selection == TabSelection.instructions {
                    if let instructions = viewModel.recipeDetails?.instructions {
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(instructions.components(separatedBy: .newlines), id: \.self) { paragraph in
                                if !paragraph.isEmpty {
                                    Text(paragraph)
                                        .font(.custom("PlayfairDisplay-Regular", size: 16))
                                        .padding(.bottom, 4)
                                        .multilineTextAlignment(.leading)
                                }
                            }
                        }}
                }
                
                if viewModel.selection == TabSelection.ingredients {
                    if viewModel.ingredientMeasurements.isEmpty {
                        Text("No ingredients")
                    } else {
                        ForEach(viewModel.ingredientMeasurements, id: \.ingredient) { pair in
                            HStack {
                                Text(pair.ingredient)
                                    .font(.custom("PlayfairDisplay-Regular", size: 16))
                                Spacer()
                                Text(pair.measurement)
                                    .font(.custom("PlayfairDisplay-Regular", size: 16))
                            }
                            .padding(.bottom, 4)
                        }
                    }
                }
                
                
                
            }
            .scrollIndicators(.visible)
            .padding()
        }
        .frame(height: 450)
        .background(Color.gray.opacity(0.25),
                    in: RoundedRectangle(cornerRadius: 15, style: .continuous))
        .padding(.horizontal)
    }
}


#Preview {
    InstructionsView(viewModel: RecipeDetailViewModel())
}
