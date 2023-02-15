//
//  Login.swift
//  Proyecto_Integrador
//
//  Created by Habieru Senso on 12/2/23.
//

import UIKit

class Login: UIViewController {

    
    @IBOutlet weak var tfUsuario: UITextField!
    @IBOutlet weak var tfContraseña: UITextField!
    
    var misDatosDecodificados:[Author]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadDataFromRemote()
        
        
    }
    
    func loadDataFromRemote()
    {
        //accedemos a un JSON remoto
        guard let miUrl = URL(string: "http://localhost:8080/users/") else
        {
            print("No se encuentra el archivo JSON Remoto")
            return
        }
        
        decodeJSON(url: miUrl)
    }
    
    func decodeJSON(url: URL)
    {
        do{
            let miDecodificador = JSONDecoder()
            let misDatos = try Data(contentsOf: url)
            self.misDatosDecodificados = try miDecodificador.decode([Author].self, from: misDatos)
            print("decodificado ")
        }
        catch
        {
            print("Error al decodificar... INUTIL")
        }
    }
    

    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    @IBAction func btnToMenu(_ sender: Any) {
        print("me diste")
        
        
    }
}
