import SwiftUI
import SwiftData

@main
struct RecipeApp: App {
    var body: some Scene {
        WindowGroup {
            main_page()
        }
        .modelContainer(for: RecipeData.self)
    }
}
