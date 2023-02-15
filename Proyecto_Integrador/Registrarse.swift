//
//  Registrarse.swift
//  Proyecto_Integrador
//
//  Created by Habieru Senso on 12/2/23.
//

import UIKit

class Registrarse: UIViewController {

    var misDatosDecodificados:[Author]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
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

}
