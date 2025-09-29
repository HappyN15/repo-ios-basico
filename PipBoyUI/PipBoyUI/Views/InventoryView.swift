import SwiftUI

// MARK: - Modelo de Inventario
struct InventoryItem: Identifiable {
    let id = UUID()
    let nombre: String
    let categoria: String
    let daño: Int?
    let defensa: Int?
    let peso: Double
    let valor: Int
    let descripcion: String
}

// MARK: - INVENTARIO VIEW
struct InventoryView: View {
    let inventario: [InventoryItem] = [
        // Armas
        InventoryItem(nombre: "Pistola 10mm", categoria: "Armas", daño: 15, defensa: nil, peso: 2.5, valor: 120, descripcion: "Arma ligera y confiable."),
        InventoryItem(nombre: "Rifle Láser", categoria: "Armas", daño: 35, defensa: nil, peso: 6.0, valor: 450, descripcion: "Tecnología de energía del pre-guerra."),
        
        // Ropa
        InventoryItem(nombre: "Traje del Refugio 101", categoria: "Ropa", daño: nil, defensa: 5, peso: 1.0, valor: 50, descripcion: "El uniforme estándar del refugio."),
        InventoryItem(nombre: "Armadura de Cuero", categoria: "Ropa", daño: nil, defensa: 15, peso: 8.0, valor: 200, descripcion: "Protección básica contra balas y golpes."),
        
        // Objetos
        InventoryItem(nombre: "Stimpak", categoria: "Objetos", daño: nil, defensa: nil, peso: 0.1, valor: 60, descripcion: "Cura heridas al instante."),
        InventoryItem(nombre: "RadAway", categoria: "Objetos", daño: nil, defensa: nil, peso: 0.2, valor: 100, descripcion: "Reduce la radiación en el cuerpo.")
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(["Armas", "Ropa", "Objetos"], id: \.self) { categoria in
                    Section(header: Text(categoria).foregroundColor(.green)) {
                        ForEach(inventario.filter { $0.categoria == categoria }) { item in
                            NavigationLink(destination: InventoryDetailView(item: item)) {
                                Text(item.nombre)
                                    .foregroundColor(.green)
                            }
                        }
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color.black)
            .navigationTitle("Inventario")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - DETALLE DE INVENTARIO
struct InventoryDetailView: View {
    let item: InventoryItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(item.nombre)
                .font(.system(size: 22, weight: .bold, design: .monospaced))
                .foregroundColor(.green)
            
            if let daño = item.daño {
                Text("Daño: \(daño)").foregroundColor(.green)
            }
            if let defensa = item.defensa {
                Text("Defensa: \(defensa)").foregroundColor(.green)
            }
            
            Text("Peso: \(item.peso, specifier: "%.1f")")
                .foregroundColor(.green)
            
            Text("Valor: \(item.valor)")
                .foregroundColor(.green)
            
            Text("Descripción: \(item.descripcion)")
                .foregroundColor(.green)
                .padding(.top, 10)
            
            Spacer()
        }
        .padding()
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Detalles")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Preview
#Preview {
    InventoryView()
}
