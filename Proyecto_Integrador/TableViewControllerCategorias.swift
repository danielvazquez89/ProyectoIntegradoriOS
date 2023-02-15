//
//  TableViewControllerCategorias.swift
//  Proyecto_Integrador
//
//  Created by Habieru Senso on 12/1/23.
//
//

import UIKit

class TableViewControllerCategorias: UITableViewController {
    
    var miDiccionarioValoraciones = [String:String]()
    var miArrayValoraciones = [[String:String]]()
    
    var misDatosDecodificados:[Generos]=[]
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        if (defaults.object(forKey: "miArrayDiccionario") as? [[String:String]] != nil) {
            
            let miArrayDiccionario = defaults.object(forKey: "miArrayDiccionario") as? [[String:String]]
            miArrayValoraciones = miArrayDiccionario!
            
            tableView.reloadData()
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        loadDataFromRemote()
        //datos dummy
        /*
        if (defaults.object(forKey: "miArrayDiccionario") as? [[String:String]] == nil) {
            miDiccionarioValoraciones["Genero"] = "Aventura"
            miDiccionarioValoraciones["IconoGenero"] = "adventureGameIcon"
            
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
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return misDatosDecodificados.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let miCelda = tableView.dequeueReusableCell(withIdentifier: "miCeldaGenero", for: indexPath as IndexPath) as? miCeldaTableViewCellUpload
            //cell.textLabel!.text = "\(nota[indexPath.row])"
       // var miCelda = miCeldaTableViewCell()
        
        miCelda?.miGenero.text = misDatosDecodificados[indexPath.row].tipo_genero
        let url = URL(string: misDatosDecodificados[indexPath.row].url_imagen)
         let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        miCelda?.miIconoGenero?.image = UIImage(data: data!)
        return miCelda!
        }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let optBorrar = UIContextualAction(style: .normal, title: "Borrar") { action, view, completion in
            self.miArrayValoraciones.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        optBorrar.image = UIImage(systemName: "trash")
        optBorrar.backgroundColor = UIColor.red
        
        let optAnadir = UIContextualAction(style: .normal, title: "Añadir") { action, view, completion in
            print("Hemos añadido")
        }
        optAnadir.image = UIImage(systemName: "plus")
        optAnadir.backgroundColor = UIColor.green
        
        let config = UISwipeActionsConfiguration(actions: [optBorrar, optAnadir])
        
        config.performsFirstActionWithFullSwipe = false
        
        return config
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "UploadProductViewController") as! UploadProductViewController
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!)! as! miCeldaTableViewCellUpload

        destination.titleString = currentCell.miGenero.text
        navigationController?.pushViewController(destination, animated: true)
    }
    
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
    class miCeldaTableViewCellUpload: UITableViewCell {
        
        @IBOutlet weak var miIconoGenero: UIImageView!
        @IBOutlet weak var miGenero: UILabel!
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }
    }

