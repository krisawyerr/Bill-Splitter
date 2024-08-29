//
//  ResultViewController.swift
//  Bill Splitter
//
//  Created by Kris Sawyerr on 8/29/24.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var ttpDescription: UILabel!
    @IBOutlet weak var ttpLabel: UILabel!
    
    var cost = 100.00
    var percent = 20.00
    var splitAmount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let ttp = round((cost * (1 + (percent / 100))) / Double(splitAmount) * 100) / 100
        ttpLabel.text = String(format: "%.2f", ttp)
        ttpDescription.text = "Split between \(splitAmount) people, with a \(Int(percent))% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
