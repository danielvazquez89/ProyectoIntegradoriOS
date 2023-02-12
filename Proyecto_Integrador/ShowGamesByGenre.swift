//
//  ShowGamesByGenre.swift
//  Proyecto_Integrador
//
//  Created by Habieru Senso on 12/2/23.
//

import UIKit

class ShowGamesByGenre: UIViewController,UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate {
    
    
    @IBOutlet weak var distanceFromYou: UISlider!
    @IBOutlet weak var variable: UILabel!
    
    @IBOutlet var table:UITableView!
    @IBOutlet var field:UITextField!
    
    var data = [String]()
    var filteredData = [String]()
    var filtered = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        distanceFromYou.minimumValue = 1
        distanceFromYou.maximumValue = 50
        
        setupData()
        table.delegate = self
        table.dataSource = self
        field.delegate  = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text {
            filterText(text+string)
        }
    
        return true
    }
    
    func filterText(_ query: String) {
        filteredData.removeAll()
        for string in data {
            if string.lowercased().starts(with: query.lowercased()) {
                filteredData.append(string)
            }
        }
        table.reloadData()
        filtered = true
    }
    
    private func setupData() {
        data.append("Last of Us")
        data.append("Ramiro")
        data.append("Bayonneta")
        data.append("Hamtaro")
        data.append("My Cocking Mama")
        data.append("Call of Duty")
        data.append("Mas Effect")
        data.append("Final Fantasy XIV")
        data.append("Candy Crush")
        data.append("Ponpeya")
        data.append("Gran Theft Auto")
        data.append("Age of Empires")
        data.append("Battlefield")
        data.append("Avatar")
        data.append("Robocob")
        data.append("Nintendogs")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !filteredData.isEmpty {
            return filteredData.count
        }
        
        return filtered ? 0 : data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCellByGenre", for: indexPath) as! searchCellByGenre
        
        if !filteredData.isEmpty {
            cell.miGenero?.text = filteredData[indexPath.row]
        }
        else
        {
            cell.miGenero?.text = data[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "ShowProductInfoByGenreViewController") as! ShowGameInfoByGenre
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!)! as! searchCellByGenre

        destination.titleString = currentCell.miGenero.text
        navigationController?.pushViewController(destination, animated: true)
    }
    
    @IBAction func awayFromYou(_ sender: Any) {
        variable.text = "\(Int(distanceFromYou.value))" + " €"
    }
}

class searchCellByGenre: UITableViewCell {
    
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
