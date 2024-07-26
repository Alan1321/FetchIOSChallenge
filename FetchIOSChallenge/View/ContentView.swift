//
//  ContentView.swift
//  FetchIOSChallenge
//
//  Created by Alan Subedi on 7/21/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var data = NetworkManager(api:"https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")
    
    var body: some View {
        NavigationView {
            List (data.meals) { meal in
                NavigationLink(destination: DetailView(meal: meal)){
                    HStack {
                        AsyncImage(url: URL(string: meal.strMealThumb)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                        Text(meal.strMeal)
                    }
                }
            }
        }
        .navigationTitle(Text("Meals"))
        .task {
            await data.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
