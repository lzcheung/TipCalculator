//
//  ViewController.swift
//  TipCalculatorV2
//
//  Created by Liang Cheung on 5/9/17.
//  Copyright © 2017 Liang Cheung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DetailsDelegate {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipController: UISegmentedControl!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipController.selectedSegmentIndex = defaults.integer(forKey: "tipIndex")
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! SettingsViewController
        controller.delegate = self
    }
    
    func updateSeg(withIndex newIndex: Int?) {
        tipController.selectedSegmentIndex = newIndex ?? 0
        calculateTip((Any).self)
    }

}

