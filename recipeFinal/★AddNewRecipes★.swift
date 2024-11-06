import SwiftUI
import SwiftData


struct AddNewRecipes: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.modelContext) var modelContext
    @State private var ingredient: [IngredientData] = [IngredientData(quantity: 0, name: "", measurement: "")]
    @State private var showIngredientPopup = false // State to control sheet visibility
    @State var recepi_title: String = ""
    @State var recepi_Description: String = ""
    //  var ingredient: Ingredient
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                // Header Section
                HStack {
                    Text("    New Recipes")
                        .font(.title)
                        .bold()
                    Spacer().frame(height: 10)
                }
                .frame(height: 80)
                .background(Color(.systemGray6))

                // Image upload area
                VStack {
                    Image(systemName: "photo.badge.plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 90, height: 90)
                        .foregroundColor(myColors.appOrange)

                    Text("Upload Photo")
                        .padding(.top, -15)
                        .font(.system(size: 25, weight: .bold))
                }
                .frame(maxWidth: .infinity, minHeight: 150)
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(myColors.appOrange, style: StrokeStyle(lineWidth: 2, dash: [5]))
                )
                .padding(.vertical)

                // Title input
                Text("Title")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.horizontal)

                TextField("Title", text: $recepi_title )
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(8)
                    .padding(.horizontal)

                // Description input
                Text("Description")
                    .font(.headline)
                    .padding(.horizontal)
                    .fontWeight(.bold)

                TextField("Description", text: $recepi_Description)
                    .frame(alignment: .leading)
                    .padding()
                    .frame(width: 367, height: 130, alignment: .topLeading)
                    .background(Color(.systemGray5))
                    .cornerRadius(8)
                    .padding(.horizontal)

                // Add Ingredients section
                HStack {
                    Text("Add Ingredient")
                        .font(.headline)
                    Spacer()
                    Button(action: {
                        showIngredientPopup.toggle() // Show popup when button is tapped
                    }) {
                        Image(systemName: "plus")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(myColors.appOrange)
                    }
                }
                .padding(.horizontal)

                Spacer()
            }
            .navigationBarItems(
                leading: Button("Back") {
                    presentationMode.wrappedValue.dismiss()
                }
                .foregroundColor(myColors.appOrange),
                trailing: Button("Save") {
//                    MyLocalSorage.myValue=self.recepi_title
                   
                }
                .foregroundColor(myColors.appOrange)
            )
        }
        .sheet(isPresented: $showIngredientPopup) {
            AddIngredientView(isPresented: .constant(false)) // The popup content view
        }
        
        HStack {
                    Text("quantity")
                        .font(.headline)
                        .foregroundColor(myColors.appOrange).bold()
                    
                    Text("name")
                        .font(.headline)
                        .foregroundColor(myColors.appOrange).bold()
//
   Spacer()
//
            Text("measurment").frame(width: 90,height:29 )                         .padding(.horizontal, 7)
                        .padding(.vertical, 2)
                        .background(myColors.appOrange)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
               
        .padding()
        .background(Color(.systemGray5)).frame(width:358, height: 52)
        .cornerRadius(8)
        .padding(.horizontal)
            }
    
    
    
    func initRecipe(recipeName: String, description: String, ing: [IngredientData]){
        let newRecipe = RecipeData(title: recipeName, description: description,  ing: ing)
        modelContext.insert(newRecipe)
    }
    
        }
        


#Preview {
    AddNewRecipes()
}
