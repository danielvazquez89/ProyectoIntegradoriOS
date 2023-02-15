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
    //filemanager
    var datos = [String]()
    
    var misDatosDecodificados:[TodosJuegos]=[]
    
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
    
    //FileManager
    func getDocumentPath() -> URL
    {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first ?? URL(string: "")!
    }
    
    func miRutaArchivo() -> URL
    {
        let miPath = getDocumentPath()
        let miFicheroURL = miPath.appending(path: "Datos.json")
        
        //let miFicheroURL2 = miPath.appendingPathExtension("Datos.json")
        
        return miFicheroURL
    }
    
    @IBAction func upload(_ sender: Any) {
        print("hola")
        let miTituloJuegoGuardar = gameTitle.text ?? "ay, lo siento cariño, no hay nah, pa tu **** casa"
        
        let miFileManager = FileManager.default
        
        leerDatos()
        
        datos.append(miTituloJuegoGuardar)
        
       // leerDatos()
        
        guardarDatos(datos: datos)
    }
    
    func guardarDatos(datos: [String])
    {
        do
        {
            let misDatosSerializados = try JSONSerialization.data(withJSONObject: datos)
            
            try misDatosSerializados.write(to: miRutaArchivo())
        }
        catch _ {
            print("Mira cariño... deja de intentarlo. ERROR FATAL DE ESCRITURA. SIN DATOS")
        }
    }
    
    
    
    func leerDatos()
    {
        do
        {
            let misDatosLeidos = try Data(contentsOf: miRutaArchivo())
            
            datos = try JSONSerialization.jsonObject(with: misDatosLeidos) as! [String] ?? []
        }
        catch _ {
            print("Mira cariña: ERES UN INUTIL!!! ERROR FATAL DE LECUTRA SIN DATOS")
        }
       // return datos
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

    func codeJSON (dataToCode:[TodosJuegos]) -> Data
    {
        let miCodificador = JSONEncoder()
        if let jsonCodificado = try? miCodificador.encode(dataToCode)
        {
            if let cadenaJSON = String(data: jsonCodificado, encoding: .utf8)
            {
                //print(cadenaJSON)
                return jsonCodificado
            }
        }
        return Data()
       // if let jsonCodificado = String(data: miCodificador, encoding: String.Encoding)
    }
    
    //esto de abajo no sirve para ontener los datos, es para publicar

    func postAPI()
    {
        //creamos la llamada a la peticion POST
        let miUrl = URL(string: "http://localhost:8080/juegos/")! //<- hay una exclamacion.... aqui
        var miRequest = URLRequest(url: miUrl)
        
        //parametrizamos la peticion
        miRequest.httpMethod = "POST" //GET, POST, PUT ....
        miRequest.httpBody = codeJSON(dataToCode: misDatosDecodificados)
        
        let miTarea = URLSession.shared.dataTask(with: miRequest) {
            data, response, error in
            guard let data = data, error == nil else
            {
                print("Error en la llamada, sin datos")
                return
            }
            print("Respuesta: \(response)")
        }
        miTarea.resume()
    }
    
}
