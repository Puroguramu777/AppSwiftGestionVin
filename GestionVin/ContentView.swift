import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Bienvenue dans Mon Cellier 🍷")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.primary)
                
                NavigationLink(destination: AccueilView()) {
                    Text("Accéder à mon cellier")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .navigationTitle("Mon Cellier")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
