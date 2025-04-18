import SwiftUI

struct AccueilView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Bienvenue dans Mon Cellier 🍷")
                    .font(.largeTitle)
                    .padding()

                NavigationLink(destination: CellierView(viewModel: CellierViewModel())) {
                    Text("Voir mon cellier")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
    }
}
