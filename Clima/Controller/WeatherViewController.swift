

import UIKit

class WeatherViewController: UIViewController,UITextFieldDelegate, WeatherDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    var weather = Weather()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weather.delegate = self
        cityTextField.delegate = self
    }

    @IBAction func searchButton(_ sender: UIButton) {
        cityTextField.endEditing(true)
      
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(cityTextField.text!)
        cityTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }else{
            textField.placeholder = "Type a Region"
            return false
        }
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = cityTextField.text{
            weather.fetchWeatherDetails(cityName: city)
        }
        cityTextField.text = ""
     
        
        
        
    }
    
    func didUpdateWeather(_ weather:Weather ,weatherModel: WeatherModel){
        DispatchQueue.main.async {
            self.temperatureLabel.text = weatherModel.tempratureString
            print(weatherModel.temprature)        }
       
    }
    
    func didFailWithError(error: Error) {
        print("Something went wrong")
    }
}

