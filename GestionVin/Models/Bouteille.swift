import Foundation

struct Bouteille: Identifiable, Codable, Hashable {
    var id: UUID
    var nom: String
    var annee: Int
    var pays: String
    var type: String
    var quantite: Int
}









