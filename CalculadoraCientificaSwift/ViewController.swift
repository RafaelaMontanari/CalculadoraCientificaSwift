//
//  ViewController.swift
//  CalculadoraCientificaSwift
//
//  Created by Rafaela on 21/04/20.
//  Copyright © 2020 Rafaela. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
            if element == "×" {
                let element1 = Double(value[index-1])!
                let element2 = Double(value[index+1])!
                let result = element1 * element2
                value[index-1] = String(result)
                print(value)
                value.remove(at: index)
                print(value)
                value.remove(at: index)
                print(value)
                counter = 0
            }
        }
        for (index, element) in value.enumerated() {
            counter = counter + 1
            if element == "÷" {
                let element1 = Double(value[index-1])!
                let element2 = Double(value[index+1])!
                let result = element1 / element2
                value[index-1] = String(result)
                print(value)
                value.remove(at: index)
                print(value)
                value.remove(at: index)
                print(value)
                counter = 0
            }
        }
        for (index, element) in value.enumerated() {
            counter = counter + 1
            if element == "+" {
                let element1 = Double(value[index-1])!
                let element2 = Double(value[index+1])!
                let result = element1 + element2
                value[index-1] = String(result)
                print(value)
                value.remove(at: index)
                print(value)
                value.remove(at: index)
                print(value)
                counter = 0
            }
        }
        for (index, element) in value.enumerated() {
            counter = counter + 1
            if element == "-" {
                let element1 = Double(value[index-1])!
                let element2 = Double(value[index+1])!
                let result = element1 - element2
                value[index-1] = String(result)
                print(value)
                value.remove(at: index)
                print(value)
                value.remove(at: index)
                print(value)
                counter = 0
            }
        }
        displayValue = value[0]
        value.removeAll()
    }
}
