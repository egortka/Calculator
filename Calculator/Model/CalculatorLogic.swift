//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Egor Tkachenko on 21/02/2019.
//  Copyright © 2019 ET. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(method: String) -> Double? {
        
        if let currentNumber = number{
            if method == "AC" {
                return 0
            } else if method == "+/-" {
                return currentNumber * -1
            } else if method == "%" {
                return currentNumber / 100
            } else if method == "=" {
                return performTwoNumbersCalculation(n2: currentNumber)
            } else {
                intermediateCalculation = (n1: currentNumber, calcMethod: method)
            }
        }
        
        return nil
    }
    
    func performTwoNumbersCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1,
            let currentMethod = intermediateCalculation?.calcMethod {
            
            switch currentMethod {
             
            case "+":
                return n1 + n2
                
            case "-":
                return n1 - n2
                
            case "×":
                return n1 * n2
                
            case "÷":
                return n1 / n2
                
            default:
                fatalError("Passed operation does not match any of the cases")
            }  
        }
        return nil
    }
}
