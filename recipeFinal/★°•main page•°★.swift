

import SwiftUI

struct main_page: View {
    @State private var isPresentingNewRecipe = false
    @State private var recipes: [String] = []
   
    
    var body: some View {
      
        NavigationView {
                    ZStack(alignment: .top) {
                        Color(.systemGray6)
                            .edgesIgnoringSafeArea(.top)
                            .frame(height: 100)

                        VStack(spacing: 0) {
                          
                            
                            HStack {
                                Text("Food Recipes")
                                    .font(.system(size: 34, weight: .bold))
                                    .padding(.leading, 16)
                                Spacer()
                            }
                            .frame(height: 100)
                            .background(Color(.systemGray6))

                            Spacer().frame(height:50)
                            
                            Image(systemName: "fork.knife.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                                .foregroundColor(.orange)
                                .padding()
                                .padding()

                            Text("There’s no recipe yet")
                                .font(.system(size: 24, weight: .bold))
                                .multilineTextAlignment(.center)
                                .padding()
                            Text("Please add your recipes")
                                .font(.system(size: 18))
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)

                            Spacer()
                        }
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
                }
            }
        }

#Preview {
    main_page()
}
