//
//  SearchGames.swift
//  Proyecto_Integrador
//
//  Created by Habieru Senso on 19/1/23.
//

import UIKit

class SearchGames: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    let games = ["FallOut","RedDead","FireEmblem","MortadeloyFilemon","Pokemon españa"]
    let imageGames = ["fallout", ""]
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Celda")
        cell.textLabel?.text = games[indexPath.row]
        
        cell.detailTextLabel?.text = "fallout"
        cell.imageView?.image = UIImage(named:"fallout")
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    



}
