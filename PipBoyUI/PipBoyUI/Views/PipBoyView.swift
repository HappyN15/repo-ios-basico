import SwiftUI

struct PipBoyView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Encabezado
                    Text("PIP-BOY 3000")
                        .font(.system(size: 22, weight: .bold, design: .monospaced))
                        .foregroundColor(.green)
                        .padding(.top, 16)
                    
                    // Tabs
                    TabView {
                        StatsView()
                            .tabItem {
                                Label("Stats", systemImage: "heart.fill")
                            }
                        
                        InventoryView()
                            .tabItem {
                                Label("Inventario", systemImage: "bag.fill")
                            }
                        
                        MapView()
                            .tabItem {
                                Label("Mapa", systemImage: "map.fill")
                            }
                    }
                    .tint(.green)
                }
            }
        }
    }
}

#Preview {
    PipBoyView()
}
