import Foundation
import Combine

// Assurez-vous que votre viewModel adopte ObservableObject
class CellierViewModel: ObservableObject {
    // Utilisation de @Published pour indiquer les propriétés observables
    @Published var bouteilles: [Bouteille] = []
    @Published var degustations: [Degustation] = []
    
    func addBouteille(_ bouteille: Bouteille) {
            self.bouteilles.append(bouteille)
        }
    // Ajouter une dégustation
    func addDegustation(_ degustation: Degustation) {
        degustations.append(degustation)
    }
    
    // Récupérer les dégustations pour une bouteille donnée
    func getDegustations(for bouteille: Bouteille) -> [Degustation] {
        return degustations.filter { $0.bouteille.id == bouteille.id }
    }
    
    // Supprimer une dégustation par index
    func removeDegustation(at index: Int) {
        degustations.remove(at: index)
    }
}
