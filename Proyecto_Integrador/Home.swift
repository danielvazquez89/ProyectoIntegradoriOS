//
//  Home.swift
//  Proyecto_Integrador
//
//  Created by Habieru Senso on 19/1/23.
//

import UIKit

class Home: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    
    @IBOutlet weak var tableView: UITableView!
    var miDiccionarioValoraciones = [String:String]()
    var miArrayValoraciones = [[String:String]]()
    
    var misDatosDecodificados:[Generos]=[]
    
    
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
        
        let defaults = UserDefaults.standard
                //datos dummy
        /*
                if (defaults.object(forKey: "miArrayDiccionario") as? [[String:String]] == nil) {
                    miDiccionarioValoraciones["Genero"] = "Aventura"
                    miDiccionarioValoraciones["IconoGenero"] = "adventureGameIcong"
                    
                    miArrayValoraciones.append(miDiccionarioValoraciones)
                    
                    miDiccionarioValoraciones["Genero"] = "Acción"
                    miDiccionarioValoraciones["IconoGenero"] = "actionGameIcon"
                    
                    miArrayValoraciones.append(miDiccionarioValoraciones)
                    
                    miDiccionarioValoraciones["Genero"] = "Arcade"
                    miDiccionarioValoraciones["IconoGenero"] = "arcadeGameIcon"
                    
                    miArrayValoraciones.append(miDiccionarioValoraciones)
                    
                    miDiccionarioValoraciones["Genero"] = "Deportes"
                    miDiccionarioValoraciones["IconoGenero"] = "sportsGameIcon"
                    
                    miArrayValoraciones.append(miDiccionarioValoraciones)
                    
                    miDiccionarioValoraciones["Genero"] = "Estrategia"
                    miDiccionarioValoraciones["IconoGenero"] = "strategyGameIcon"
                    
                    miArrayValoraciones.append(miDiccionarioValoraciones)
                    
                    miDiccionarioValoraciones["Genero"] = "Juegos de mesa"
                    miDiccionarioValoraciones["IconoGenero"] = "boargameGameIcon"
                    
                    miArrayValoraciones.append(miDiccionarioValoraciones)
                }
         */
        
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
            
           /*     let miCelda = tableView.dequeueReusableCell(withIdentifier: "celdaGenero", for: indexPath as IndexPath) as? miCeldaTableViewCell
                //cell.textLabel!.text = "\(nota[indexPath.row])"
           // var miCelda = miCeldaTableViewCell()
            let miDiccionario = miArrayValoraciones[indexPath.row]
            miCelda?.miGenero.text = miDiccionario["Genero"]
            miCelda?.miGeneroImagen.image = UIImage(named:  miDiccionario["IconoGenero"]!)
         */
            //añadir
            
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "celdaGenero")
            
            cell.textLabel?.text = misDatosDecodificados[indexPath.row].tipo_genero
            
          /*  let url = URL(string: misDatosDecodificados[indexPath.row].url_imagen)
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            cell = UIImage(data: data!)
            
            */
            
            return cell
            }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }
    
    //select
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "ShowProductByGenreViewController") as! ShowGamesByGenre
        //let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath)! as! miCeldaTableViewCell

        navigationController?.pushViewController(destination, animated: true)
    }
    
    //fin select
    
    // vamos a conectarnos a la api
    func loadDataFromRemote()
    {
        //accedemos a un JSON remoto
        guard let miUrl = URL(string: "http://localhost:8080/generos/") else
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
            self.misDatosDecodificados = try miDecodificador.decode([Generos].self, from: misDatos)
            print("decodificado ")
        }
        catch
        {
            print("Error al decodificar... INUTIL")
        }
    }
    
    
}

class miCeldaTableViewCell: UITableViewCell {
        
  
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
