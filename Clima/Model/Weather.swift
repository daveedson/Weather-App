

import Foundation



protocol WeatherDelegate{
    func didUpdateWeather(_ weather:Weather ,weatherModel: WeatherModel)
    func didFailWithError(error: Error)
} 

struct Weather{
    let url = "https://api.openweathermap.org/data/2.5/weather?appid=ed258fceb50f868e327cf9097bed27a0&units=metric"
    
    var delegate:WeatherDelegate?
    
    func fetchWeatherDetails(cityName:String){
        let urlString = "\(url)&q=\(cityName)"
        print(urlString)
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String){
        
        //1  create a url
        if  let url = URL(string: urlString){
            
            //2  create a url session
            let session = URLSession(configuration: .default)
            
            //3 Give the session a task
            let task =   session.dataTask(with: url) {data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData =  data{
                    
                    if  let weather = self.parseJson(safeData) {
                        self.delegate?.didUpdateWeather(self, weatherModel:weather)
                    }
                    
                    
                }
                
            }
            
            //4. Start the task
            task.resume()
        }
    }
    
    func parseJson(_ weatherData: Data)-> WeatherModel?{
        let decodedData = JSONDecoder()
        do{
            let responseData = try decodedData.decode(WeatherData.self, from: weatherData)
            let id = responseData.weather[0].id
            let temp = responseData.main.temp
            let name = responseData.name
            let weather = WeatherModel(conditionId: id, cityName: name, temprature: temp)
            
            return weather
            print(weather.conditionName)
            print(weather.tempratureString)
            
        }catch{
            delegate?.didFailWithError(error: error)
            return nil
            
        }
    }
}
