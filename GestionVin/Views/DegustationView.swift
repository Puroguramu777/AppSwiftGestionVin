import SwiftUI

struct DegustationView: View {
    @ObservedObject var viewModel: CellierViewModel
    @State private var selectedBouteille: Bouteille? = nil
    @State private var note: Int = 0
    @State private var commentaire: String = ""
    @State private var accompagnement: String = ""

    var body: some View {
        Form {
            Section(header: Text("Choisir une bouteille")) {
                Picker("Choisir une bouteille", selection: $selectedBouteille) {
                    ForEach(viewModel.bouteilles, id: \.id) { bouteille in
                        Text(bouteille.nom).tag(bouteille as Bouteille?)
                    }
                }
            }

            Section(header: Text("Évaluation")) {
                Picker("Note", selection: $note) {
                    ForEach(1..<6) { value in
                        Text("\(value)").tag(value)
                    }
                }
            }

            Section(header: Text("Commentaire")) {
                TextField("Ajoutez un commentaire", text: $commentaire)
            }

            Section(header: Text("Accompagnement")) {
                TextField("Accompagnement suggéré", text: $accompagnement)
            }

            Button("Enregistrer la dégustation") {
                // Vérifier que la bouteille est sélectionnée
                if let selectedBouteille = selectedBouteille {
                    // Créer la dégustation
                    let degustation = Degustation(
                        id: UUID(),
                        bouteille: selectedBouteille,
                        note: note,
                        commentaire: commentaire,
                        accompagnement: accompagnement,
                        date: Date()
                    )
                    
                    // Ajouter la dégustation au viewModel
                    viewModel.addDegustation(degustation)
                    
                    // Optionnel: Vous pouvez remettre les champs à zéro après l'enregistrement
                    self.note = 0
                    self.commentaire = ""
                    self.accompagnement = ""
                }
            }

            
            // Affichage des dégustations
            Section(header: Text("Dégustations enregistrées")) {
                if let selectedBouteille = selectedBouteille {
                    let degustations = viewModel.getDegustations(for: selectedBouteille)
                    List(degustations) { degustation in
                        VStack(alignment: .leading) {
                            Text("Note: \(degustation.note)")
                            Text("Commentaire: \(degustation.commentaire)")
                            Text("Accompagnement: \(degustation.accompagnement)")
                            Text("Date: \(degustation.date, formatter: dateFormatter)")
                        }
                    }
                }
            }
        }
        .navigationTitle("Dégustation")
    }

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
}
