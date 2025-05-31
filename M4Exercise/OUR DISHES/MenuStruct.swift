import Foundation

struct JSONMenu: Codable {
    // add code here
}


struct MenuItem: Codable, Identifiable {
    let id = UUID()
    let title: String
    let price: String
}
