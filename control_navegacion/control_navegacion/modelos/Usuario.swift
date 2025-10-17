struct Usuario: Codable, Identifiable {
    var id: Int
    var name: String
    var username: String
    var email: String
    var phone: String
    var website: String
    var address: Direccion
    var company: Compania
}

struct Direccion: Codable {
    var street: String
    var suite: String
    var city: String
    var zipcode: String
}

struct Compania: Codable {
    var name: String
    var catchPhrase: String
    var bs: String
}
