import SwiftUI

struct countryView: View {
    var flag:String
    var officialName: String
    var capital:[String]?
    var region: String
    var area: Float
    var population: Int
    var borders:[String]?
    
    var body: some View {
        Text(flag)
            .font(.system(size: 150))
        
        Group {
                
            Text("Official name of the Country:")
            
            Text(officialName)
                .bold()
                .padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
            
            ForEach(capital ?? [], id: \.self) { cap in
                Text("The capital of the Country: ")
                Text(cap)
                    .bold()
                    .padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
            }
            
            Text("Region of the Country")
            Text(region)
                .bold()
                .padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
            
            let formattedArea = String(format: "area: %.2f", area)
            Text("Area of the Country:")
            Text(formattedArea)
                .bold()
                .padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
            
            Text("Population of the Country:")
            Text("\(population)")
                .bold()
                .padding(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
            
            if ((borders?.isEmpty) == false) {
                Text("bordering with Countries:")
                ForEach(borders ?? [], id: \.self) { bor in
                    Text((bor))
                        .bold()
                }.listStyle(.plain)
            } else {
                Text("No bordering countries!")
            }
        }
        Spacer()
        
    }
}

struct ContentView: View {
    @StateObject var fetcher = CountryFetcher()
    
    var body: some View {
        
            NavigationView {
                ScrollView {
                    LazyVStack {
                        
                        if (fetcher.countries.count > 0) {
                            ForEach(fetcher.countries, id: \.self.name.common) { countries in
                                NavigationLink(destination: countryView(flag: countries.flag, officialName: countries.name.official, capital: countries.capital, region: countries.region, area: countries.area, population: countries.population, borders: countries.borders)) {
                                    
                                    Text("\(countries.flag)")
                                        .font(.system(size: 30))
                                    
                                    Text("\(countries.name.common)")
                                        .font(.system(size: 20))
                                        .foregroundColor(Color.gray)
                                        .bold()
                                    Spacer()
                                }.padding(.init(top: 1, leading: 2, bottom: 1, trailing: 2))
                            }
                        } else {
                            Text("Loading...")
                                .font(.system(size: 20))
                        }
                    }.task {
                        try? await fetcher.fetchData()
                    }
                }.padding()
                    .navigationTitle("Countries")
                    .font(Font.title)
                
            }.navigationViewStyle(.automatic)
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

