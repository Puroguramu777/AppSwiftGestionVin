import SwiftUI

struct CellierView: View {
    @ObservedObject var viewModel: CellierViewModel

    var body: some View {
        NavigationView {
            List(viewModel.bouteilles) { bouteille in
                VStack(alignment: .leading, spacing: 8) {
                    Text(bouteille.nom)
                        .font(.headline)

                    HStack {
                        Text("Année: \(bouteille.annee)")
                        Spacer()
                        Text("Quantité: \(bouteille.quantite)")
                    }
                    .font(.subheadline)

                    HStack {
                        Text("Pays: \(bouteille.pays)")
                        Spacer()
                        Text("Type: \(bouteille.type)")
                    }
                    .font(.subheadline)

                    NavigationLink(destination: DegustationView(viewModel: viewModel)) {
                        Text("Nouvelle Dégustation")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                }
                .padding(.vertical, 8)
            }
            .navigationTitle("Cellier")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AjoutBouteilleView(viewModel: viewModel)) {
                        Text("Ajouter")
                    }
                }
            }
        }
    }
}
