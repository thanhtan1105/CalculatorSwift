//
//  SettingController.swift
//  tips
//
//  Created by Le Thanh Tan on 11/6/15.
//  Copyright © 2015 Le Thanh Tan. All rights reserved.
//

import UIKit

protocol SettingControllerDelegate {
    func getTipPercent (percents: Double)
}

class SettingController: UIViewController {

    
    @IBOutlet weak var segment: UISegmentedControl!
    var tipPercentArr : NSMutableArray = []
    var delegate: SettingControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tipPercentArr = [0.18, 0.2, 0.25]
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Bordered, target: self, action: "back:")
        self.navigationItem.leftBarButtonItem = newBackButton;
        
    }
    
    func back(sender: UIBarButtonItem) {
        // Perform your custom actions
        // ...
        // Go back to the previous ViewController
        let index: Int = segment.selectedSegmentIndex
        let variable = (tipPercentArr[index] as! NSNumber).doubleValue
        delegate?.getTipPercent(variable)

        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    @IBAction func onValueSegmentChanged(sender: AnyObject) {
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
