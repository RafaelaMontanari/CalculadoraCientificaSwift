//
//  ViewController.swift
//  CalculadoraCientificaSwift
//
//  Created by Rafaela on 21/04/20.
//  Copyright © 2020 Rafaela. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Operations: String {
        case percent = "%"
        case add = "+"
        case subtract = "-"
        case multiply = "×"
        case divide = "÷"
        case solve = "resolver"
        case none = ""
    }
    
    @IBOutlet weak var tfDisplay: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var displayValue: String = "0" {
        didSet {
            tfDisplay.text = displayValue
        }
    }

    @IBAction func btNumbers(_ sender: UIButton) {
        if let number = sender.titleLabel!.text {
            if displayValue == "0"{
                displayValue = number == "." ?  "0." : number
            } else {
                displayValue = displayValue + number
            }
        }
    }
    
    @IBAction func backspace(_ sender: UIButton) {
        if displayValue.count > 1 {
            displayValue.removeLast()
        } else {
            displayValue = "0"
        }
    }
    
    @IBAction func operations(_ sender: UIButton) {
        if let op = sender.titleLabel!.text {
            if displayValue == "0" {
                displayValue = op
            } else {
                displayValue = displayValue + op
            }
        }
        if let operation = Operations(rawValue: sender.titleLabel!.text!) {
            if operation == .percent {
                calculatePercent ()
            }
            if operation == .solve {
                calculateSolve ()
            }
        }
        
    }
    
    func calculatePercent () {}
    
    func calculateSolve () {}
}
