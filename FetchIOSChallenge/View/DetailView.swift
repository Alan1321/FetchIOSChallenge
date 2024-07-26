//
//  DetailView.swift
//  FetchIOSChallenge
//
//  Created by Alan Subedi on 7/21/24.
//

import Foundation
import SwiftUI

import SwiftUI

struct DetailView: View {
    var meal: Meal
    @StateObject var details: DetailNetworkManager
    
    init(meal: Meal) {
        self.meal = meal
        _details = StateObject(wrappedValue: DetailNetworkManager(api: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(meal.idMeal)"))
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    if let detail = details.detail {
                        AsyncImage(url: URL(string: detail.strMealThumb)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                        } placeholder: {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                        }

                        Text(detail.strMeal)
                            .font(.headline)
                            .padding(.top)

                        Text("Instructions: \(detail.strInstructions)")
                            .font(.subheadline)
                            .padding(.horizontal)
                            .fixedSize(horizontal: false, vertical: true)

                        Text("Ingredients: \(combineIngredients(mealDetail: detail))")
                            .font(.body)
                            .padding(.horizontal)
                    } else {
                        Text("Loading...")
                            .font(.body)
                            .padding()
                            .multilineTextAlignment(.center)
                    }
                }
                .padding()
            }
            .navigationTitle("Meal Details")
            .task {
                await details.fetchData()
            }
        }

    }
    
}

