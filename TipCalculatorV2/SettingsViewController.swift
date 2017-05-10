//
//  SettingsViewController.swift
//  TipCalculatorV2
//
//  Created by Liang Cheung on 5/9/17.
//  Copyright © 2017 Liang Cheung. All rights reserved.
//

import UIKit

protocol DetailsDelegate: class {
    func updateSeg(withIndex newIndex: Int?)
}

class SettingsViewController: UIViewController {
    
    weak var delegate: DetailsDelegate?
    @IBOutlet weak var tipValue: UISegmentedControl!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipValue.selectedSegmentIndex = defaults.integer(forKey: "tipIndex")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.updateSeg(withIndex: tipValue.selectedSegmentIndex)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        defaults.set(tipValue.selectedSegmentIndex, forKey: "tipIndex")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
