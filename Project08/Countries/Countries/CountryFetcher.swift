import Foundation

@MainActor
class CountryFetcher: ObservableObject {
    let urlString = "https://restcountries.com/v3.1/all?fields=name,flag,capital,region,area,population,borders"
    
    @Published var countries: [country] = []
    
    enum FetchError: Error {
        case badRequest
    }
    
    func fetchData() async throws {
        guard let url = URL(string: urlString) else {throw FetchError.badRequest;}
        
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {throw FetchError.badRequest}
        
        countries = try JSONDecoder().decode([country].self, from: data)
    }
}
