//
//  MealData.swift
//  FetchIOSChallenge
//
//  Created by Alan Subedi on 7/21/24.
//

import Foundation


struct Meal: Identifiable, Decodable {
    var id: String {idMeal}
    var strMeal: String
    var strMealThumb: String
    var idMeal: String
}

struct Meals: Decodable {
    var meals: [Meal]
}

