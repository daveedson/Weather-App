

import UIKit

class WeatherViewController: UIViewController {

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

}


//MARK: - UITextFieldDelegate
extension WeatherViewController : UITextFieldDelegate{
    
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

}


//MARK: - WeatherDelegate

extension WeatherViewController : WeatherDelegate{
  
    func didUpdateWeather(_ weather:Weather ,weatherModel: WeatherModel){
        DispatchQueue.main.async {
            self.temperatureLabel.text = weatherModel.tempratureString
            self.cityLabel.text = weatherModel.cityName
            self.conditionImageView.image = UIImage(systemName: weatherModel.conditionName)
            print(weatherModel.temprature)        }
       
    }
    
    func didFailWithError(error: Error) {
        print("Something went wrong")
    }
}
