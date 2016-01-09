//
//  ViewController.swift
//  Tips
//
//  Created by Nathaniel Hajian on 8/25/15.
//  Copyright (c) 2015 Nathaniel Hajian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var twoPeopleLabel: UILabel!
    @IBOutlet weak var threePeopleLabel: UILabel!
    @IBOutlet weak var fourPeopleLabel: UILabel!
    @IBOutlet weak var waveView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        let highlightedPurple = UIColor(red: 177/255, green: 89/255, blue: 1, alpha: 1)
        let backgroundPurple = UIColor(red: 92/255, green: 64/255, blue: 137/255, alpha: 1)
        
        self.view.backgroundColor = backgroundPurple
        tipControl.tintColor = highlightedPurple
        
        billField.backgroundColor = backgroundPurple
        billField.layer.borderColor = highlightedPurple.CGColor
        billField.layer.borderWidth = 1
        billField.layer.cornerRadius = 5
        
        waveView.backgroundColor = UIColor(patternImage: UIImage(named: "wave")!)

        let size = UIImage(named: "wave")!.size;

        UIView.animateWithDuration(4, delay: 0, options: [ .Autoreverse, /*.BeginFromCurrentState,*/ .Repeat], animations: {
            self.waveView.frame = CGRect(x: -self.waveView.frame.size.width / 2, y: self.waveView.frame.origin.y, width: size.width, height: size.height)
            }, completion: nil)
        
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text!).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        var twoPeopleTip = total / 2
        var threePeopleTip = total / 3
        var fourPeopleTip = total / 4
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        twoPeopleLabel.text = String(format: "$%.2f", twoPeopleTip)
        threePeopleLabel.text = String(format: "$%.2f", threePeopleTip)
        fourPeopleLabel.text = String(format: "$%.2f", fourPeopleTip)
        
    }

    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
        
    }
}

