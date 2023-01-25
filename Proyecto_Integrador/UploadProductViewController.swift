//
//  UploadProductViewController.swift
//  ProyectoIntegradoriOS
//
//  Created by Daniel Vázquez Pérez on 19/1/23.
//

import UIKit

class UploadProductViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    var titleString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text! += titleString
        titleLabel.textAlignment = .center
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
