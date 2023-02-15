//
//  Ajustes.swift
//  Proyecto_Integrador
//
//  Created by Habieru Senso on 12/2/23.
//

import UIKit

class Ajustes: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    

    @IBAction func vovlerMenu(_ sender: Any) {
        let miStoryBoard = UIStoryboard(name: "Main", bundle: nil)
       let opcionPantalla = miStoryBoard.instantiateViewController(withIdentifier: "vistaLogin") as! Login
        
        opcionPantalla.modalPresentationStyle = .fullScreen
        opcionPantalla.modalTransitionStyle = .flipHorizontal
        
        present(opcionPantalla, animated: true)
    }
    
}
