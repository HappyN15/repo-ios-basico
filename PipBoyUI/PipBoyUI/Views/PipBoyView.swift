import SwiftUI


struct PipBoyView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.green, lineWidth: 4)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.black.opacity(0.8)))
                    .padding()
                
                VStack(spacing: 0) {
                    // Título Pip-Boy
                    Text("PIP-BOY by Vault Tec")
                        .font(.system(size: 24, weight: .bold, design: .monospaced))
                        .foregroundColor(.green)
                        .padding(.top)
                    
                    // Tabs
                    TabView {
                        StatsView()
                            .tabItem {
                                VStack {
                                    Image(systemName: "heart.fill")
                                    Text("Stats")
                                }
                            }
                        
                        InventoryView()
                            .tabItem {
                                VStack {
                                    Image(systemName: "bag.fill")
                                    Text("Inventario")
                                }
                            }
                        
                        MapView()
                            .tabItem {
                                VStack {
                                    Image(systemName: "map.fill")
                                    Text("Mapa")
                                }
                            }
                    }
                    .accentColor(.green)
                }
            }
        }
    }
}

#Preview {
    PipBoyView()
}
