
import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
        
        ZStack {
            BackgroundView(topColor: isNight ? .black : .blue,
                           bottomColor: isNight ? .gray : Color("LightBlue"))
            VStack{
                CityTextView(cityName: "Bishkek, KG")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: isNight ? 45 : 75)

                    HStack(spacing: 20) {
                        WeatherDayView(dayOfWeek: "Tue",
                                       ImageName: "cloud.sun.fill",
                                       temperature: 76)
                        WeatherDayView(dayOfWeek: "Wed",
                                       ImageName: "sun.max.fill",
                                       temperature: 82)
                        WeatherDayView(dayOfWeek: "Thur",
                                       ImageName: "cloud.rain.fill",
                                       temperature: 68)
                        WeatherDayView(dayOfWeek: "Fri",
                                       ImageName: "cloud.hail.fill",
                                       temperature: 54)
                        WeatherDayView(dayOfWeek: "Sat",
                                       ImageName: "wind.snow",
                                       temperature: 46)

                    }
                    Spacer()
                    
                    Button {
                        isNight.toggle()
                        
                    } label: {
                    WeatherButton(title: "Change the day time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                    }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct WeatherDayView: View {
    
    var dayOfWeek: String = ""
    var ImageName: String = ""
    var temperature: Int = 0
    
    var body: some View {
        VStack() {
            
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: ImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text(String(temperature))
                .font(.system(size: 25, weight: .medium, design: .default))
                .foregroundColor(.white)
            
        }
    }
}

struct BackgroundView: View {
    var topColor: Color = .white
    var bottomColor: Color = .white
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String = ""
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding(.top, 30)
    }
}

struct MainWeatherStatusView: View {
    var imageName: String = ""
    var temperature: Int = 0
    
    var body: some View{

            VStack(spacing: 8) {
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                
                Text(String(temperature))
                    .font(.system(size: 70, weight: .medium, design: .default))
                    .foregroundColor(.white)
            }
            .padding(.bottom, 40)
    }
}
