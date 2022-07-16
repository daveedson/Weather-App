

import UIKit

class WeatherViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityTextField.delegate = self
    }

    @IBAction func searchButton(_ sender: UIButton) {
        cityTextField.endEditing(true)
        print(cityTextField.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(cityTextField.text!)
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
        cityTextField.text = ""
    }
}

