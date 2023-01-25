//
//  TableViewControllerCategorias.swift
//  ProyectoIntegradoriOS
//
//  Created by Daniel Vázquez Pérez on 12/1/23.
//

import UIKit

class TableViewControllerCategorias: UITableViewController {
    var miDiccionarioValoraciones = [String:String]()
    var miArrayValoraciones = [[String:String]]()
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
        //datos dummy
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
        return miArrayValoraciones.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let miCelda = tableView.dequeueReusableCell(withIdentifier: "celdaGenero", for: indexPath as IndexPath) as? miCeldaTableViewCell
            //cell.textLabel!.text = "\(nota[indexPath.row])"
       // var miCelda = miCeldaTableViewCell()
        let miDiccionario = miArrayValoraciones[indexPath.row]
        miCelda?.miGenero.text = miDiccionario["Genero"]
        miCelda?.miIconoGenero.image = UIImage(named: miDiccionario["IconoGenero"]!)
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
        let currentCell = tableView.cellForRow(at: indexPath!)! as! miCeldaTableViewCell

        destination.titleString = currentCell.miGenero.text
        navigationController?.pushViewController(destination, animated: true)
    }
    
}
    class miCeldaTableViewCell: UITableViewCell {
        
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

