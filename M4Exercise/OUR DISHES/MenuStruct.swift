import Foundation

struct JSONMenu: Codable {
    var menuItems: [MenuItem] = []
}


struct MenuItem: Codable, Identifiable {
    let id = UUID()
    var title: String = ""
    var price: String = ""
}
