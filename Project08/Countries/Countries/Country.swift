import Foundation

struct countryName: Codable {
    var common: String
    var official: String
}


struct country: Codable {
    var name: countryName
    var flag: String
    var capital: [String]?
    var region: String
    var area: Float
    var population:Int
    var borders: [String]?
}




