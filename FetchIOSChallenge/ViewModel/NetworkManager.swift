import Foundation

class NetworkManager: ObservableObject {
    @Published var meals = [Meal]()
    @Published var api: String
    
    init(api: String){
        self.api = api
    }
    
    func fetchData() async {
        if let url = URL(string: api) {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let resp = try JSONDecoder().decode(Meals.self, from: data)
                
                let sortedMeals = resp.meals.sorted { $0.idMeal < $1.idMeal }
                
                self.meals = sortedMeals
                print(self.meals)
            } catch {
                print("Eror in api call")
            }

        } else {
            return
        }
    }
}


