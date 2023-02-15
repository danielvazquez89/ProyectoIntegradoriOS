//
//  Registrarse.swift
//  Proyecto_Integrador
//
//  Created by Habieru Senso on 12/2/23.
//

import UIKit

class Registrarse: UIViewController {

    
    @IBOutlet weak var registroMail: UITextField!
    @IBOutlet weak var registroContraena: UITextField!
    @IBOutlet weak var registrosegundaContrasena: UITextField!
    @IBOutlet weak var registroDireccion: UITextField!
    @IBOutlet weak var registroCP: UITextField!
    @IBOutlet weak var registroCiudad: UITextField!
    @IBOutlet weak var registroCumpleanos: UITextField!
    
    @IBOutlet weak var registroAltera: UILabel!
    
    var misDatosDecodificados:[Author]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registroAltera.isHidden=true
       
    }
    

    func codeJSON (dataToCode:[Author]) -> Data
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
    
    func postAPI()
    {
        //creamos la llamada a la peticion POST
        let miUrl = URL(string: "http://localhost:8080/users/")! //<- hay una exclamacion.... aqui
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
    
    
   
        @IBAction func DarAltaUsuario(_ sender: Any) {
            
            let mail:String
            mail = registroMail.text!
            
            let contrasenaUno:String
            contrasenaUno = registroContraena.text!
            
            let contrasenaDos:String
            contrasenaDos = registrosegundaContrasena.text!
            
            let direccion:String
            direccion = registroDireccion.text!
            
            let cp:String
            cp = registroCP.text!
            
            let ciudad:String
            ciudad = registroCiudad.text!
            
            let cumpleanos:String
            cumpleanos = registroCumpleanos.text!
            
            if (mail == "" || contrasenaUno == "" || contrasenaDos == "" || direccion == "" || cp == "" || ciudad == "" || cumpleanos == "")
                {
                registroAltera.isHidden=false
            }
            else
            {
                registroAltera.isHidden=true
            let miStoryBoard = UIStoryboard(name: "Main", bundle: nil)
            let opcionPantalla = miStoryBoard.instantiateViewController(withIdentifier: "vistaLogin") as! Login
            
            opcionPantalla.modalPresentationStyle = .fullScreen
            opcionPantalla.modalTransitionStyle = .flipHorizontal
            
            present(opcionPantalla, animated: true)
        }
    }
    
}
