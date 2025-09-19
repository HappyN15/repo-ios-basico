import Foundation


struct InventoryItem: Identifiable {
    let id = UUID()
    let nombre: String
    let tipo: String
    let cantidad: Int
}
