//
//  UploadProductViewController.swift
//  Proyecto_Integrador
//
//  Created by Habieru Senso on 12/1/23.
//

import UIKit

class UploadProductViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    @IBOutlet weak var gameTitle: UITextField!
    @IBOutlet weak var priceSlider: UISlider!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectGender: UIPickerView!
    @IBOutlet weak var frontImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    
    let arrayDatos = ["Switch","Playstation 5", "XBox", "Wii U","Spectrum","Atari","Amstrad"]
 
    
    var titleString: String!
    var select = "Aventuradss"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        priceLabel.text = "1 €"
        priceSlider.minimumValue = 1
        priceSlider.maximumValue = 50
        // Do any additional setup after loading the view.
        frontImage.image = (UIImage(named: "adventureGameIcon"))
        //titleLabel.text! += titleString
        //titleLabel.textAlignment = .center
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayDatos.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayDatos[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        select = arrayDatos[row]
    }
    
    @IBAction func slidervalue(_ sender: Any) {
        priceLabel.text = "\(Int(priceSlider.value))" + " €"
    }
    //comentario
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
