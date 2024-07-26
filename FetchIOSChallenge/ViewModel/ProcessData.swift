//
//  ProcessData.swift
//  FetchIOSChallenge
//
//  Created by Alan Subedi on 7/25/24.
//

import Foundation


func combineIngredients(mealDetail: MealDetail) -> String {
    let allIngredients = [
        mealDetail.strIngredient1, mealDetail.strIngredient2, mealDetail.strIngredient3, mealDetail.strIngredient4,
        mealDetail.strIngredient5, mealDetail.strIngredient6, mealDetail.strIngredient7, mealDetail.strIngredient8,
        mealDetail.strIngredient9, mealDetail.strIngredient10, mealDetail.strIngredient11, mealDetail.strIngredient12,
        mealDetail.strIngredient13, mealDetail.strIngredient14, mealDetail.strIngredient15, mealDetail.strIngredient16,
        mealDetail.strIngredient17, mealDetail.strIngredient18, mealDetail.strIngredient19, mealDetail.strIngredient20
    ].compactMap { $0?.isEmpty == false ? $0 : nil }
    .joined(separator: ", ")
    
    return allIngredients
}

func combineMeasure(mealDetail: MealDetail) -> String {
    let allMeasures = [
        mealDetail.strMeasure1, mealDetail.strMeasure2, mealDetail.strMeasure3, mealDetail.strMeasure4,
        mealDetail.strMeasure5, mealDetail.strMeasure6, mealDetail.strMeasure7, mealDetail.strMeasure8,
        mealDetail.strMeasure9, mealDetail.strMeasure10, mealDetail.strMeasure11, mealDetail.strMeasure12,
        mealDetail.strMeasure13, mealDetail.strMeasure14, mealDetail.strMeasure15, mealDetail.strMeasure16,
        mealDetail.strMeasure17, mealDetail.strMeasure18, mealDetail.strMeasure19, mealDetail.strMeasure20
    ].compactMap { $0?.isEmpty == false ? $0 : nil }
    .joined(separator: ", ")
    
    return allMeasures
}

