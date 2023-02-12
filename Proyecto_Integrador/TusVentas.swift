//
//  TusVentas.swift
//  Proyecto_Integrador
//
//  Created by Habieru Senso on 12/2/23.
//

import UIKit

class TusVentas: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var miDiccionarioValoraciones = [String:String]()
        var miArrayValoraciones = [[String:String]]()
        override func viewWillAppear(_ animated: Bool) {
            let defaults = UserDefaults.standard
            if (defaults.object(forKey: "miArrayDiccionario") as? [[String:String]] != nil) {
                
                let miArrayDiccionario = defaults.object(forKey: "miArrayDiccionario") as? [[String:String]]
                miArrayValoraciones = miArrayDiccionario!
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        let defaults = UserDefaults.standard
                //datos dummy
                if (defaults.object(forKey: "miArrayDiccionario") as? [[String:String]] == nil) {
                    miDiccionarioValoraciones["Genero"] = "Hamtaro"
                    miDiccionarioValoraciones["IconoGenero"] = "Hamtaro"
                    
                    miArrayValoraciones.append(miDiccionarioValoraciones)
                    
                    miDiccionarioValoraciones["Genero"] = "Pokemon Monstrupo"
                    miDiccionarioValoraciones["IconoGenero"] = "Pokemon_Monstrupo"
                    
                    miArrayValoraciones.append(miDiccionarioValoraciones)
                    
                }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }

         func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return miArrayValoraciones.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
                let miCelda = tableView.dequeueReusableCell(withIdentifier: "miCeldaVentasTableViewCell", for: indexPath as IndexPath) as? miCeldaVentasTableViewCell
                //cell.textLabel!.text = "\(nota[indexPath.row])"
           // var miCelda = miCeldaTableViewCell()
            let miDiccionario = miArrayValoraciones[indexPath.row]
            miCelda?.miGenero.text = miDiccionario["Genero"]
            miCelda?.miGeneroImagen.image = UIImage(named:  miDiccionario["IconoGenero"]!)
            return miCelda!
            }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }
    
    //select
    
    //fin select
    
}

class miCeldaVentasTableViewCell: UITableViewCell {
        
  
    @IBOutlet weak var miGenero: UILabel!
    @IBOutlet weak var miGeneroImagen: UIImageView!
    
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }
    }
