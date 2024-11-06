import Foundation
import SwiftData
@Model
    
class RecipeData {
 
    var title: String
    var description_data: String
    var imageName: String
    @Relationship(deleteRule: .cascade) var ing : [IngredientData]
    init(title: String, description: String, imageName: String = "", ing : [IngredientData]) {
        self.title = title
        self.description_data = description
        self.imageName = imageName
        self.ing = ing
    }
}


@Model
class IngredientData {
 
    var quantity: Int
    var name: String
    var measurement: String
    
    init(quantity: Int, name: String, measurement: String) {
        self.quantity = quantity
        self.name = name
        self.measurement = measurement
    }
}
