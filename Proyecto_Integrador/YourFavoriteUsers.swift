//
//  YourFavoriteUsers.swift
//  Proyecto_Integrador
//
//  Created by Habieru Senso on 12/2/23.
//

import UIKit

class YourFavoriteUsers: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
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
                    miDiccionarioValoraciones["Genero"] = "Pepe_45"
                    miDiccionarioValoraciones["IconoGenero"] = "Pepe_45"
                    
                    miArrayValoraciones.append(miDiccionarioValoraciones)
                    
                    miDiccionarioValoraciones["Genero"] = "El_roblox"
                    miDiccionarioValoraciones["IconoGenero"] = "El_roblox"
                    
                    miArrayValoraciones.append(miDiccionarioValoraciones)
                    
                    miDiccionarioValoraciones["Genero"] = "face_ip"
                    miDiccionarioValoraciones["IconoGenero"] = "face_ip"
                    
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
            
                let miCelda = tableView.dequeueReusableCell(withIdentifier: "celdaUsuarioFavorito", for: indexPath as IndexPath) as? miCeldaUsuarioTableViewCell
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "ShowFavoriteUserProfile") as! showUserInfo
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!)! as! miCeldaUsuarioTableViewCell
        destination.titleString = currentCell.miGenero.text
        navigationController?.pushViewController(destination, animated: true)
    }
    
    //fin select
    
}

class miCeldaUsuarioTableViewCell: UITableViewCell {
        
  
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
