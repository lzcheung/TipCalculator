//
//  ViewController.swift
//  TipCalculatorV2
//
//  Created by Liang Cheung on 5/9/17.
//  Copyright © 2017 Liang Cheung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipController: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billField.becomeFirstResponder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentage = [0.15, 0.18, 0.20]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentage[tipController.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "+ $%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

}

