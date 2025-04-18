import SwiftUI

struct AjoutBouteilleView: View {
    @ObservedObject var viewModel: CellierViewModel
    @Environment(\.dismiss) var dismiss // Utilisation de dismiss pour revenir en arrière
    @State private var nom: String = ""
    @State private var annee: String = "" // Utilisation d'un String pour permettre une validation plus facile
    @State private var quantite: String = ""
    @State private var pays: String = ""
    @State private var type: String = ""
    @State private var errorMessage: String = "" // Variable pour afficher les erreurs

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Ajouter une bouteille")) {
                    // Champ Nom avec un placeholder
                    TextField("Nom de la bouteille", text: $nom)
                        .autocapitalization(.words) // Capitalisation automatique du nom

                    // Champ Année avec un placeholder
                    TextField("Année", text: $annee)
                        .keyboardType(.numberPad) // Utilisation du clavier numérique pour l'année

                    // Champ Quantité avec un placeholder
                    TextField("Quantité", text: $quantite)
                        .keyboardType(.numberPad) // Clavier numérique pour la quantité

                    // Champ Pays avec un placeholder
                    TextField("Pays d'origine", text: $pays)
                        .autocapitalization(.words)

                    // Champ Type avec un placeholder
                    TextField("Type de vin", text: $type)
                        .autocapitalization(.words)
                }

                // Afficher les messages d'erreur
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }

                Button(action: {
                    // Validation basique pour s'assurer que les champs sont remplis
                    guard let quantiteInt = Int(quantite),
                          let anneeInt = Int(annee),
                          !nom.isEmpty,
                          !pays.isEmpty,
                          !type.isEmpty else {
                        // Gestion d'erreur si les champs ne sont pas valides
                        errorMessage = "Tous les champs doivent être remplis correctement"
                        return
                    }

                    // Créer la nouvelle bouteille avec un ID unique
                    let nouvelleBouteille = Bouteille(
                        id: UUID(),  // ID unique pour chaque bouteille
                        nom: nom,
                        annee: anneeInt,
                        pays: pays,
                        type: type,
                        quantite: quantiteInt
                    )
                    
                    // Ajouter la bouteille au viewModel
                    viewModel.addBouteille(nouvelleBouteille)

                    // Retour à la vue précédente (CellierView)
                    dismiss()
                }) {
                    Text("Ajouter la bouteille")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationTitle("Ajout de Bouteille")
        }
    }
}
