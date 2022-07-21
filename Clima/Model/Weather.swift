

import Foundation


struct Weather{
    let url = "https://api.openweathermap.org/data/2.5/weather?appid=ed258fceb50f868e327cf9097bed27a0&units=metric"
    
    
    func fetchWeatherDetails(cityName:String){
        let urlString = "\(url)&q=\(cityName)"
        print(urlString)
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        
        //1  create a url
        if  let url = URL(string: urlString){
            
            //2  create a url session
            let session = URLSession(configuration: .default)
            
            //3 Give the session a task
            let task =   session.dataTask(with: url) {data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData =  data{
                    let dataString = String(data: safeData, encoding: .utf8)
                    print(dataString!)
                    let decodedData = JSONDecoder()
                    do{
                        let responseData = try decodedData.decode(WeatherData.self, from: safeData)
                        print(responseData.weather[0].description)
                    }catch{
                        print(error)
                    }
                   
                }
                
            }
            
            //4. Start the task
            task.resume()
        }     
    }
    
    
    
//    func decodeData(weatherData: Data) {
//        let decodedData = JSONDecoder()
//        do{
//         let responseData =    try  decodedData.decode(WeatherData.self, from: weatherData)
//            print(responseData.name)
//
//        }catch {
//            print(error)
//        }
//
//    }
    
}
