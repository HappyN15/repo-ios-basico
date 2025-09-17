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

// MARK: - Vista de Stats
struct StatsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                // HP/AP/RAD
                VStack(alignment: .leading, spacing: 10) {
                    StatBar(name: "HP", value: 75)
                    StatBar(name: "AP", value: 50)
                    StatBar(name: "RAD", value: 20)
                }
                .padding()
                
                Divider().background(Color.green)
                
                // S.P.E.C.I.A.L
                VStack(alignment: .leading, spacing: 10) {
                    Text("S.P.E.C.I.A.L")
                        .font(.system(size: 18, weight: .bold, design: .monospaced))
                        .foregroundColor(.green)
                    
                    StatBar(name: "Strength", value: 80)
                    StatBar(name: "Perception", value: 60)
                    StatBar(name: "Endurance", value: 70)
                    StatBar(name: "Charisma", value: 40)
                    StatBar(name: "Intelligence", value: 90)
                    StatBar(name: "Agility", value: 55)
                    StatBar(name: "Luck", value: 65)
                }
                .padding()
                
                Spacer()
            }
            .padding()
        }
    }
}

// MARK: - Vista de Inventario
struct InventoryView: View {
    struct Item: Identifiable {
        let id = UUID()
        let nombre: String
        let tipo: String
        let cantidad: Int
    }
    
    let items: [Item] = [
        Item(nombre: "Pistola", tipo: "Arma", cantidad: 1),
        Item(nombre: "Rifle", tipo: "Arma", cantidad: 1),
        Item(nombre: "Escopeta", tipo: "Arma", cantidad: 1),
        Item(nombre: "Poción", tipo: "Objeto", cantidad: 5),
        Item(nombre: "Medkit", tipo: "Objeto", cantidad: 3),
        Item(nombre: "RadAway", tipo: "Objeto", cantidad: 2)
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
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

// MARK: - Vista de Mapa
struct MapView: View {
    let points: [CGPoint] = [
        CGPoint(x: 0.2, y: 0.3),
        CGPoint(x: 0.5, y: 0.6),
        CGPoint(x: 0.8, y: 0.2)
    ]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            GeometryReader { geo in
                ZStack {
                    // Líneas de cuadrícula
                    ForEach(0..<11) { i in
                        Path { path in
                            let spacingX = geo.size.width / 10
                            path.move(to: CGPoint(x: CGFloat(i) * spacingX, y: 0))
                            path.addLine(to: CGPoint(x: CGFloat(i) * spacingX, y: geo.size.height))
                        }
                        .stroke(Color.green.opacity(0.3), lineWidth: 1)
                        
                        Path { path in
                            let spacingY = geo.size.height / 10
                            path.move(to: CGPoint(x: 0, y: CGFloat(i) * spacingY))
                            path.addLine(to: CGPoint(x: geo.size.width, y: CGFloat(i) * spacingY))
                        }
                        .stroke(Color.green.opacity(0.3), lineWidth: 1)
                    }
                    
                    // Puntos de interés
                    ForEach(points.indices, id: \.self) { i in
                        let point = points[i]
                        Circle()
                            .fill(Color.green)
                            .frame(width: 12, height: 12)
                            .position(x: point.x * geo.size.width, y: point.y * geo.size.height)
                    }
                }
            }
            .padding()
        }
    }
}

// MARK: - Barra de estadística
struct StatBar: View {
    var name: String
    var value: CGFloat
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(.system(.caption, design: .monospaced))
                .foregroundColor(.green)
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .frame(height: 10)
                    .foregroundColor(.gray.opacity(0.3))
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: value * 2, height: 10)
                    .foregroundColor(.green)
            }
        }
    }
}

// MARK: - Previews
struct PipBoyView_Previews: PreviewProvider {
    static var previews: some View {
        PipBoyView()
    }
}
