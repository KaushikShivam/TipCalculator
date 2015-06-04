//
//  ViewController.swift
//  TipCalculator
//
//  Created by shivam kaushik on 02/06/15.
//  Copyright (c) 2015 shivam kaushik. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  //number button outlets
  @IBOutlet weak var one: UIButton!
  @IBOutlet weak var two: UIButton!
  @IBOutlet weak var three: UIButton!
  @IBOutlet weak var four: UIButton!
  @IBOutlet weak var five: UIButton!
  @IBOutlet weak var six: UIButton!
  @IBOutlet weak var seven: UIButton!
  @IBOutlet weak var eight: UIButton!
  @IBOutlet weak var nine: UIButton!
  @IBOutlet weak var zero: UIButton!
  
  
  @IBOutlet weak var point: UIButton!
  
  @IBOutlet weak var reduceTipPercentage: UIButton!
  @IBOutlet weak var increaseTipPercentage: UIButton!
  
  //Label outlets
  
  @IBOutlet weak var tipPercentage: UILabel!
  @IBOutlet weak var billAmountLabel: UILabel!
  @IBOutlet weak var tipAmountLabel: UILabel!
  @IBOutlet weak var totalAmountLabel: UILabel!
  
  var isUserTypingNumber = false
  var tipPercent: Double = 0
  
  
  //Display for the bill label
  var billDisplay = ""
  var displayValue: Double {
    get {
      return NSNumberFormatter().numberFromString(billDisplay)!.doubleValue
    }
    set {
      billDisplay = "\(newValue)"
    }
  }

  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func digitTapped(sender: UIButton) {
    let digit = sender.currentTitle
    
    if isUserTypingNumber == false {
      billDisplay = ""
      billDisplay = digit!
      billAmountLabel.text = "$" + billDisplay
      isUserTypingNumber = true
    } else if isUserTypingNumber == true {
      billDisplay = billDisplay + digit!
      billAmountLabel.text = "$" + billDisplay
    }
    
  }
  
  
  
  @IBAction func changeTipPercent(sender: UIButton) {
    let tip = sender.currentTitle
    
    switch tip! {
    case "+":
      tipPercent = tipPercent + 5.0
    case "−":
      tipPercent = tipPercent - 5.0
    default:
      break
    }
    tipPercentage.text = "\(tipPercent)" + "%"
    var tipCalculation = (displayValue * tipPercent) / 100
    tipAmountLabel.text = "$\(tipCalculation)"
    totalAmountLabel.text = "$\(displayValue + tipCalculation)"
  }
  
  
  
  @IBAction func clearButtonTapped(sender: UIButton) {
    billDisplay = ""
    tipPercent = 0
    
    billAmountLabel.text = "$0"
    tipPercentage.text = "0%"
    tipAmountLabel.text = "$0"
    totalAmountLabel.text = "$0"
  }
  
  
  


}

