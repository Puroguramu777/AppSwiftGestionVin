import Foundation

struct Degustation: Identifiable, Codable, Hashable {
    var id: UUID = UUID()
    var bouteille: Bouteille
    var note: Int
    var commentaire: String
    var accompagnement: String
    var date: Date
}



