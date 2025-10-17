import SwiftUI

struct PantallaPerfil: View {
    var usuario: Usuario
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.blue)
                    VStack(alignment: .leading) {
                        Text(usuario.name)
                            .font(.title)
                            .fontWeight(.bold)
                        Text("@\(usuario.username)")
                            .foregroundColor(.gray)
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    Label(usuario.email, systemImage: "envelope")
                    Label(usuario.phone, systemImage: "phone")
                    Label(usuario.website, systemImage: "globe")
                }
                .font(.body)
                .foregroundColor(.secondary)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("🏠 Dirección")
                        .font(.headline)
                    Text("\(usuario.address.street), \(usuario.address.suite)")
                    Text("\(usuario.address.city), CP \(usuario.address.zipcode)")
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("🏢 Compañía")
                        .font(.headline)
                    Text(usuario.company.name)
                        .bold()
                    Text(usuario.company.catchPhrase)
                        .italic()
                    Text(usuario.company.bs)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Perfil de Usuario")
    }
}
