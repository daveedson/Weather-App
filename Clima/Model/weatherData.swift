
import Foundation


struct WeatherData : Decodable{
    
    let name : String
    let main: Main
    let weather: [DWeather]
}

struct Main: Decodable{
    let temp: Double
}


struct DWeather: Decodable{
    let description: String
     
}
