//
//  ViewController.swift
//  CalculadoraCientificaSwift
//
//  Created by Rafaela on 21/04/20.
//  Copyright © 2020 Rafaela. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Buttons: String {
        case zero = "0"
        case one = "1"
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case score = "."
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
    
    var value: [String] = []
    var numbers = ""
    var result = "0"

    @IBAction func btButtons(_ sender: UIButton) {
        if let element = sender.titleLabel!.text {
            if displayValue == "0"{
                displayValue = element == "." ?  "0." : element
            } else {
                displayValue = displayValue + element
            }
            switch element {
            case "1", "2","3","4","5","6", "7","8","9","0",".":
                numbers = numbers + element
            case "RESOLVER":
                value.append(numbers)
                numbers = ""
            default:
                value.append(numbers)
                numbers = ""
                value.append(element)
            }
        }
    }
    
    @IBAction func backspace(_ sender: UIButton) {
        if displayValue.count > 1 {
            displayValue.removeLast()
        } else {
            displayValue = "0"
        }
        value.removeLast()
    }
    
    @IBAction func ac(_ sender: UIButton) {
        displayValue = "0"
        value.removeAll()
    }
    
    @IBAction func solve(_ sender: UIButton) {
        print(value)
        var counter = 0
        for (index, element) in value.enumerated() {
            counter = counter + 1
            if element == "+" {
                let add1 = Double(value[index-1])!
                let add2 = Double(value[index+1])!
                let result = add1 + add2
                print(result)
                displayValue = String(result)
            }
        }
        value.removeAll()
    }
}
