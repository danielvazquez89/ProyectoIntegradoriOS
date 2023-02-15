//
//  showUserInfo.swift
//  Proyecto_Integrador
//
//  Created by Habieru Senso on 12/2/23.
//

import UIKit

class showUserInfo: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    @IBOutlet weak var nombreUsuario: UILabel!
    @IBOutlet weak var fotoUsuario: UIImageView!
    
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
    
    
    var titleString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fotoUsuario.image = UIImage(named: "Pepe_45")
        nombreUsuario.text! = titleString
        nombreUsuario.textAlignment = .center
        
        
        let defaults = UserDefaults.standard
                //datos dummy
                if (defaults.object(forKey: "miArrayDiccionario") as? [[String:String]] == nil) {
                    miDiccionarioValoraciones["Juego"] = "Last of Us"
                    miDiccionarioValoraciones["IconoJuego"] = "lastofus"
                    
                    miArrayValoraciones.append(miDiccionarioValoraciones)
                    
                    miDiccionarioValoraciones["Juego"] = "Hamtaro"
                    miDiccionarioValoraciones["IconoJuego"] = "Hamtaro"
                    
                    miArrayValoraciones.append(miDiccionarioValoraciones)
        
                }
        
        // Do any additional setup after loading the view.
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
            
                let miCelda = tableView.dequeueReusableCell(withIdentifier: "suCeldaTableViewCell", for: indexPath as IndexPath) as? suCeldaTableViewCell
                //cell.textLabel!.text = "\(nota[indexPath.row])"
           // var miCelda = miCeldaTableViewCell()
            let miDiccionario = miArrayValoraciones[indexPath.row]
            miCelda?.suJuego.text = miDiccionario["Juego"]
            miCelda?.suJuegoImagen.image = UIImage(named:  miDiccionario["IconoJuego"]!)
            return miCelda!
            }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }
    
    //select
    /*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "ShowProductInfoByGenreViewController") as! ShowGameInfoByGenre
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!)! as! suCeldaTableViewCell

        navigationController?.pushViewController(destination, animated: true)
    }
    */
}

class suCeldaTableViewCell: UITableViewCell {
        
  
    @IBOutlet weak var suJuego: UILabel!
    @IBOutlet weak var suJuegoImagen: UIImageView!
    
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }
    }
