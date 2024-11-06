import SwiftUI

struct AddIngredientView: View {
    @Binding var isPresented: Bool
    @State private var ingredientName = ""
    @State private var measurement = "🥄Spoon"
    @State private var servingCount = 1
    let measurements = ["🥄Spoon", "🥛Cup"]
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Ingredient Name Input
            Text("Ingredient Name")
                .font(.headline)
                .bold()
            TextField("Ingredient Name", text: $ingredientName)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(8)
            
            // Measurement Selection
            Text("Measurement")
                .font(.headline)
                .bold()
            HStack(spacing: 8) {
                ForEach(measurements, id: \.self) { measure in
                    Button(action: {
                        measurement = measure
                    }) {
                        HStack {
                            Image(systemName: measure == "Spoon" ? "🥄" : "🥛")
                            Text(measure)
                        }
                        .padding(8)
                        .frame(maxWidth: .infinity)
                        .background(measurement == measure ? Color(myColors.appOrange) : Color(.systemGray5))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                }
            }
            
            // Serving Section with Label and Stepper in the same row
            Text("Serving")
                .font(.headline)
                .bold()
            HStack {
                HStack(spacing: 4) {
                 
                    Button(action: {
                        if servingCount > 1 {
                            servingCount -= 1
                        }
                    }) {
                        Image(systemName: "minus.square")
                            .font(.system(size: 30))
                            .foregroundColor(myColors.appOrange)
                    }
                    
                    Text("\(servingCount)").bold()
                        .font(.title3)
                        .frame(width: 30)
                        .padding(.horizontal, 5)
                        .background(Color(.systemGray5))
                        .cornerRadius(8)
                    
                    Button(action: {
                        servingCount += 1
                    }) {
                        Image(systemName: "plus.square")
                            .font(.system(size: 30))
                            .foregroundColor(myColors.appOrange)
                    }
                }
                .padding(8)
                .background(Color(.systemGray5))
                .cornerRadius(8)
                
                HStack {
                    Image(systemName: measurement == "Spoon" ? "🥄" : "🥛")
                    Text(measurement)
                }
               
                .frame(width:134 , height:45)
                .background(Color(myColors.appOrange))
                .foregroundColor(.white)
                .cornerRadius(8)
            }

            Spacer()
            
            // Cancel and Add buttons
            HStack(spacing: 16) {
                Button(action: { dismiss()
                    isPresented = true // Dismiss the popup
                }) {
                    Text("Cancel")
                        .frame(width:88, height: 20)
                        .padding()
                        .background(Color(.systemGray5))
                        .foregroundColor(.red)
                        .cornerRadius(8)
                }
                
                Button(action: {
                    // Action to add the ingredient
                    isPresented = false // Dismiss the popup
                }) {
                    Text("Add")
                        .frame(width:88, height: 20)
                        .padding()
                        .background(Color(myColors.appOrange))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding(.horizontal)
        }
        .padding()
        .frame(width: 300, height: 400, alignment: .center)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: .gray.opacity(0.4), radius: 10, x: 0, y: 4)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
        .padding() // Additional padding to ensure the popup fits correctly
    }
}
#Preview {
    AddIngredientView(isPresented: .constant(false))
}
