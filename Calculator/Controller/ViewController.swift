//
//  ViewController.swift
//  Calculator
//
//  Created by Egor Tkachenko on 21/02/2019.
//  Copyright © 2019 ET. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var isFinishedTypingNumbers: Bool = true
    
    var calculator = CalculatorLogic()
    
    private var displayValue: Double {
        get {
            guard let value = Double(displayLabel.text!) else {fatalError("Can not convert display label to a Double")}
                return value
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var displayLabel: UILabel!
    
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        if let calcMethod = sender.titleLabel?.text {
            
            calculator.setNumber(displayValue)
            
            if let result = calculator.calculate(method: calcMethod) {
                displayValue = result
            }
            
            isFinishedTypingNumbers = true
        }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumbers {
                if numValue == "." {
                    displayLabel.text = "0."
                } else {
                    displayLabel.text = numValue
                }
                isFinishedTypingNumbers = false
            } else {
                if let currentLabel = displayLabel.text{
                    if numValue != "." || !currentLabel.contains(".") {
                        displayLabel.text!.append(contentsOf: numValue)
                    }
                }
            }
        }
    }
}

