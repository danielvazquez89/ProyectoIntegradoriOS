//
//  FavoritesController.swift
//  Proyecto_Integrador
//
//  Created by Habieru Senso on 8/2/23.
//

import UIKit

class FavoritesController: UIViewController,UITableViewDelegate,UITableViewDataSource {
 
    var data = [String]()
    
    private func setupData() {
        data.append("Last of Us")
        data.append("Ramiro")
        data.append("Bayonneta")
  
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaFavoritos", for: indexPath) as! celdaFavoritos
        
        return cell
    }
    
    

}

class celdaFavoritos: UITableViewCell {
    

    @IBOutlet weak var misJuegosFav: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
