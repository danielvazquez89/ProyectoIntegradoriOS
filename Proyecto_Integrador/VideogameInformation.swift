//
//  VideogameInformation.swift
//  Proyecto_Integrador
//
//  Created by Habieru Senso on 20/1/23.
//

import UIKit

class VideogameInformation: UIViewController {
    @IBOutlet weak var titleGame: UILabel!
    @IBOutlet weak var gameImage: UIImageView!
    

    var titleString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameImage.image = UIImage(named: "actionGameIcon")
        titleGame.text! = titleString
        titleGame.textAlignment = .center
        
     
        
        // Do any additional setup after loading the view.
    }
    
}
