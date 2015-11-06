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
    var tipPercent : Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        tipPercent = 1.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        print("User editing bill %@", tipPercent)
        
        let billAmount = billField.text
        
        if billAmount?.characters.count > 0 {
            let billAmountDouble: Double = Double(billAmount!)!
            let tip: Double = billAmountDouble * tipPercent
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "settingVC" {
            (segue.destinationViewController as! SettingController).delegate = self
        }
    }
}

extension ViewController: SettingControllerDelegate {
    func getTipPercent (percents: Double) {
        tipPercent = percents
    }
}

