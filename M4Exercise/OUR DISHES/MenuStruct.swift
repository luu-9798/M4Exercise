import Foundation

struct JSONMenu: Codable {
    var menu: [MenuItem] = []
}


struct MenuItem: Codable, Identifiable {
    let id = UUID()
    var title: String = ""
    var price: String = ""
}
