//
//  ViewController.swift
//  tips
//
//  Created by Le Thanh Tan on 11/5/15.
//  Copyright © 2015 Le Thanh Tan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        print("User editing bill")
        let billAmount = billField.text
        let tipPercent : Array = [0.18, 0.2, 0.25]
        
        
        if billAmount?.characters.count > 0 {
            let billAmountDouble: Double = Double(billAmount!)!
            let tip: Double = billAmountDouble * tipPercent[tipControl.selectedSegmentIndex]
            let total = billAmountDouble + tip
            
            tipLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
            
        } else {
            tipLabel.text = "$0.00"
            totalLabel.text = "$0.00"
        }
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        
    }
    
    @IBAction func onValueSegmentedChanged(sender: AnyObject) {
        self.onEditingChanged("")
        
    }
    
    
}

