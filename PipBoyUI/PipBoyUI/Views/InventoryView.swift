import SwiftUI


struct InventoryView: View {
    let items: [InventoryItem] = [
        InventoryItem(nombre: "Pistola", tipo: "Arma", cantidad: 1),
        InventoryItem(nombre: "Rifle", tipo: "Arma", cantidad: 1),
        InventoryItem(nombre: "Escopeta", tipo: "Arma", cantidad: 1),
        InventoryItem(nombre: "Stimpak", tipo: "Objeto", cantidad: 5),
        InventoryItem(nombre: "Nuka Cola", tipo: "Objeto", cantidad: 3),
        InventoryItem(nombre: "RadAway", tipo: "Objeto", cantidad: 2)
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                ForEach(items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.nombre)
                                .font(.system(size: 18, weight: .bold, design: .monospaced))
                                .foregroundColor(.green)
                            
                            Text(item.tipo)
                                .font(.system(.caption, design: .monospaced))
                                .foregroundColor(.green.opacity(0.7))
                            
                            if item.tipo == "Objeto" {
                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 4)
                                        .frame(height: 8)
                                        .foregroundColor(.green.opacity(0.2))
                                    
                                    RoundedRectangle(cornerRadius: 4)
                                        .frame(width: CGFloat(item.cantidad * 20), height: 8)
                                        .foregroundColor(.green)
                                }
                                .padding(.top, 4)
                            }
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color.black) // 👈 para que no salga blanco
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.green, lineWidth: 1)
                    )
                }
            }
            .padding()
        }
        .background(Color.black) // 👈 importante
    }
}

