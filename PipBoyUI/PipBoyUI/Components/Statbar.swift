import SwiftUI


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

