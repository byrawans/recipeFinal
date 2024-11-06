import Foundation


struct Recipe: Identifiable {
    let id = UUID()
    var title: String
    var description: String
    var imageName: String
}

