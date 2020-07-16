//
//  ResultViewController.swift
//  My Tips
//
//  Created by Ebubechukwu Dimobi on 08.07.2020.
//  Copyright © 2020 blazeapps. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var splitTipLabel: UILabel!
    @IBOutlet weak var informationLabel: UILabel!
    
    var splitAmount: String?
    var information: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        splitTipLabel.text = splitAmount
        informationLabel.text = information
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
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
