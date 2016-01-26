//
//  ViewController.swift
//  Calculator
//
//  Created by Chandra Prasetya S on 1/24/16.
//  Copyright © 2016 chandps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isTyping = false
    var brain = CalculatorBrain()
    
    @IBOutlet weak var display: UILabel!

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if isTyping {
            display.text = display.text! + digit
        } else {
            display.text = digit
            isTyping = true
        }
    }

    @IBAction func operate(sender: UIButton) {
        if isTyping {
            enter()
        }
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(operation){
                displayValue = result
            } else {
                displayValue = 0
            }
        }
    }
    
    
    @IBAction func enter() {
        isTyping = false
        if let result = brain.pushOperand(displayValue) {
            displayValue = result
        } else {
            displayValue = 0
        }
    }

    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
        }
    }
    
    
}

