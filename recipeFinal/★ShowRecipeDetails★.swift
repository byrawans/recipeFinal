
import SwiftUI

struct ShowRecipeDetails: View {
    var recipe: Recipe
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
               
                HStack {
                    Button(action: {
                   
                    }) {
                        Text(" Edit")
                            .padding(.vertical, 1)
                            .foregroundColor(.orange)
                    }
                    Spacer()
                    Button(action: {
                        // Edit action
                    }) {
                        Text("save ")
                            .foregroundColor(.orange)  .padding(.vertical, 1)
                    }
                }
                .padding(.bottom)
                
                Text(recipe.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
            
                    .padding ()
                Image(recipe.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text(recipe.description)
                    .font(.body)
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                
                Text("Ingredients")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .padding(.top)
                
                VStack(alignment: .leading) {
                    }
                }
                Button(action: {
                }) {
                    Text("Delete Recipe")
                        .foregroundColor(.red)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal)
                }
                .padding(.top)
            }.navigationBarBackButtonHidden(true)
        }
    }


#Preview {
    RecipeCard(recipe: Recipe(title: " Halomi Salad", description: " Semi-hard cheese typically made from the milk of goats, sheep, or cows. It's known for its tangy taste and firm, chewy texture.", imageName: "img"))}
