
import Foundation


struct WeatherData : Codable{
    
    let name : String
    let main: Main
    let weather: [DWeather]
}

struct Main: Codable{
    let temp: Double
}


struct DWeather: Codable{
    let description: String
    let id:Int
    
}
