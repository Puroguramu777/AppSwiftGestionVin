import SwiftUI

@main
struct GestionVinApp: App {
    @StateObject var cellierVM = CellierViewModel()

    var body: some Scene {
        WindowGroup {
            TabView {
                // CellierView sans passage de `selectedBouteille`
                CellierView(viewModel: cellierVM)
                    .tabItem { Label("Cellier", systemImage: "wineglass") }

                AjoutBouteilleView(viewModel: cellierVM)
                    .tabItem { Label("Ajouter", systemImage: "plus.circle") }

                // Ne pas passer `selectedBouteille`, le gestionnaire est déjà fait dans `DegustationView`
                DegustationView(viewModel: cellierVM)
                    .tabItem { Label("Dégustation", systemImage: "star.circle") }
            }
        }
    }
}
