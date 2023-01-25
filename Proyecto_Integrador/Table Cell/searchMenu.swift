//
//  searchMenu.swift
//  Proyecto_Integrador
//
//  Created by Habieru Senso on 13/1/23.
//

import UIKit

class searchMenu: UIViewController, UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier:  CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
    }
    
    
    @IBOutlet var table: UITableView!
    
    var models = [Model]()
    
    let searchBar = UISearchBar()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self

    }
    
    // table
    
    
}

struct Model {
    let text: String
    let imageName: String
    init (text: String, imageName: String) {
        self.text = text
        self.imageName = imageName
    }
}
