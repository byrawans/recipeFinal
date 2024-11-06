
import SwiftUI

struct RecipeCard: View {
    
    @State private var isPresentingNewRecipe = false
    @State private var searchText = ""
    var recipe: Recipe
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Header with Gray Background, Title, and Search Bar
                ZStack(alignment: .bottom) {
                    Color(.systemGray6)
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 130) // Adjust height as needed
                    
                    VStack(spacing: 8) {
                        HStack {
                            Text("Food Recipes")
                                .font(.system(size: 34, weight: .bold))
                                .padding(.leading, 16)
                            Spacer()
                        }
                        
                        // Search Bar positioned at the bottom of the gray area
                        HStack {
                            Image(systemName: "magnifyingglass") // Magnifying glass icon
                                .foregroundColor(.gray)
                                .padding(.leading, 10) // Add padding to align with TextField
                            
                            TextField("Search", text: $searchText)
                                .padding(0)
                            
                            Button(action: {
                                // Microphone action can be implemented here
                            }) {
                                Image(systemName: "mic.fill") // Microphone icon
                                    .foregroundColor(.gray)
                            }
                            .padding(.trailing, 10) // Add padding to align with TextField
                            
                        }
                        .padding(10)
                        .background(Color(.systemGray5))
                        .cornerRadius(8)
                        .padding(.horizontal, 6)
                        .padding(.bottom, 8)
                        .padding(.bottom, 8)
                    } // Adjust padding to position the search bar correctly
                }
                
                NavigationLink(destination: ShowRecipeDetails(recipe: recipe)) {
                                  ZStack(alignment: .bottomLeading) {
                                      Image(recipe.imageName)
                                          .resizable()
                                          .aspectRatio(contentMode: .fill)
                                          .frame(height: 250)
                                          .clipped()

        LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.7)]), startPoint: .top, endPoint: .bottom)
                                          .frame(height: 250)

                                      VStack(alignment: .leading, spacing: 4) {
                                          Text(recipe.title)
                                              .font(.title2)
                                              .bold()
                                              .foregroundColor(.white)

                                          Text(recipe.description)
                                              .font(.body)
                                              .foregroundColor(.white)
                                              .lineLimit(2)

                                          Text("See All")
                                              .font(.caption)
                                              .bold()
                                              .foregroundColor(myColors.appOrange)
                                      }
                                      .padding()
                                  }
                                  .cornerRadius(10)
                                  .padding(.horizontal)
                              }
                              .buttonStyle(PlainButtonStyle()) // Use PlainButtonStyle to prevent default button styling

                              Spacer()
                          }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isPresentingNewRecipe = true
                    }) {
                        Image(systemName: "plus")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(myColors.appOrange)
                    }
                    .sheet(isPresented: $isPresentingNewRecipe) {
                        AddNewRecipes()
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
        
        
    }
}

#Preview {
    RecipeCard(recipe: Recipe(title: " Halomi Salad", description: " Semi-hard cheese typically made from the milk of goats, sheep, or cows. It's known for its tangy taste and firm, chewy texture.", imageName: "img"))
    
}
