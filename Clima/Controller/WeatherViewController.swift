

import UIKit

class WeatherViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    let weather = Weather()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
}

