import SwiftUI

struct PantallaPerfil: View {
    var usuario: Usuario
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                
                // 🔹 Encabezado con degradado y foto de perfil
                ZStack(alignment: .bottomLeading) {
                    LinearGradient(colors: [.blue.opacity(0.8), .purple.opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing)
                        .frame(height: 160)
                        .cornerRadius(20)
                    
                    HStack(spacing: 16) {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: 90))
                            .foregroundStyle(.white)
                            .shadow(radius: 8)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(usuario.name)
                                .font(.title2)
                                .bold()
                                .foregroundStyle(.white)
                            Text("@\(usuario.username)")
                                .font(.subheadline)
                                .foregroundStyle(.white.opacity(0.8))
                        }
                    }
                    .padding()
                }
                
                // 🔹 Información de contacto
                VStack(alignment: .leading, spacing: 12) {
                    Text("📞 Contacto")
                        .font(.headline)
                        .foregroundColor(.blue)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Label(usuario.email, systemImage: "envelope.fill")
                        Label(usuario.phone, systemImage: "phone.fill")
                        Label(usuario.website, systemImage: "globe")
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                }
                
                // 🔹 Dirección
                VStack(alignment: .leading, spacing: 12) {
                    Text("Dirección")
                        .font(.headline)
                        .foregroundColor(.blue)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("\(usuario.address.street), \(usuario.address.suite)")
                        Text("\(usuario.address.city), CP \(usuario.address.zipcode)")
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                }
                
                // 🔹 Compañía
                VStack(alignment: .leading, spacing: 12) {
                    Text("Compañía")
                        .font(.headline)
                        .foregroundColor(.blue)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(usuario.company.name)
                            .bold()
                        Text(usuario.company.catchPhrase)
                            .italic()
                        Text(usuario.company.bs)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Perfil de Usuario")
        .navigationBarTitleDisplayMode(.inline)
    }
}
