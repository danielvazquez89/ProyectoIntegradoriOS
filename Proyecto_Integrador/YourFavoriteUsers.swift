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
    
    var misDatosDecodificados:[Author]=[]
    
        override func viewWillAppear(_ animated: Bool) {
            let defaults = UserDefaults.standard
            if (defaults.object(forKey: "miArrayDiccionario") as? [[String:String]] != nil) {
                
                let miArrayDiccionario = defaults.object(forKey: "miArrayDiccionario") as? [[String:String]]
                miArrayValoraciones = miArrayDiccionario!
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        loadDataFromRemote()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }

         func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return misDatosDecodificados.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "celdaUsuarioFavorito", for: indexPath as IndexPath) as? miCeldaUsuarioTableViewCell
            
            cell?.miUsuarioFavorito?.text = misDatosDecodificados[indexPath.row].nombre
            
            return cell!
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
        destination.titleString = currentCell.miUsuarioFavorito.text
        navigationController?.pushViewController(destination, animated: true)
    }
    
    //fin select func loadDataFromRemote()
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
    
    
    
}

class miCeldaUsuarioTableViewCell: UITableViewCell {
        
  
    @IBOutlet weak var miUsuarioFavorito: UILabel!
    @IBOutlet weak var miUsuarioFavoritoImagen: UIImageView!
    
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }
    }
