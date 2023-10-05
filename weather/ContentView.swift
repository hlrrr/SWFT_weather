
import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false  // Create the state.
    
    var body: some View {
        ZStack{
//            BackgroundView(topColor: isNight ? .black : .blue, // Read the state.
//                           bottomColor: isNight ? .gray : Color("ex1"))
            BackgroundView(isNight: isNight) // Pass a binding.
            
            VStack(spacing: 9) {   // space btw elements
                CityTextView(cityName: "Seoul, KR")
                
                MainWeatherStatusView(imgName: isNight ? "cloud.moon.fill" : "cloud.sun.fill",
                                      temperature: 22)
                
                HStack(spacing: 22) {
                    WeatherDayView(dayOfWeek: "Tue",
                                   imageName: "cloud.hail.fill",
                                   temperature: 11)
//
                    WeatherDayView(dayOfWeek: "Wed",
                                   imageName: "cloud.bolt.rain.fill",
                                   temperature: 9)

                    WeatherDayView(dayOfWeek: "Thu",
                                   imageName: "cloud.sun.rain.fill",
                                   temperature: 8)

                    WeatherDayView(dayOfWeek: "Fri",
                                   imageName: "cloud.moon.bolt.fill",
                                   temperature: 7)

                    WeatherDayView(dayOfWeek: "Sat",
                                   imageName: "wind.snow",
                                   temperature: 6)
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                 } label: {
                    WeathereButton(title: "change day time",
                                   backgroundColor: .gray,
                                   textColor: .white)
                }
                Spacer()
            }
        }
    }
}

struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 22, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
//                .symbolRenderingMode(.multicolor)
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .foregroundColor(.white)
                .aspectRatio(contentMode: .fit)
                .frame(width: 44, height: 44)
            
            Text("\(temperature)°")
                .font(.system(size: 22, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView : View {
//    var topColor: Color
//    var bottomColor: Color
    var isNight: Bool

    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? . gray : Color("ex1")]),     // Read the state.
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//            .ignoresSafeArea()
       ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View{
    
    var cityName: String
    
    var body: some View{
        Text(cityName)
            .font(.system(size: 33, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imgName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: imgName) // symbols have different ratio
    //                    Image(systemName: "sun.max.fill")
                .renderingMode(.original)   // for multi color
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 222, height: 222)
            
            Text("\(temperature)°")
                .font(.system(size: 66, weight: .medium))
                .foregroundColor(.white)
            
            }
    //                Spacer()
            .padding(.bottom, 44)
        }
}
