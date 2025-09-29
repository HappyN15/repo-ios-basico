import SwiftUI

struct MapView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                Text("MAPA")
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                    .foregroundColor(.green)
                
                Spacer()
                
                Image(systemName: "map")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.green)
                
                Spacer()
            }
        }
    }
}

#Preview {
    MapView()
}

