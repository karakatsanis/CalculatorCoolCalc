//
//  ViewController.swift
//  CoolCalc
//
//  Created by Karakatsanis Georgios on 5/5/20.
//  Copyright © 2020 Wrk.gr. All rights reserved.
//  Version 2 Adding multiple buttons to IBAction

import UIKit
import Foundation

class ViewController: UIViewController {
    
    var firstNumber: Double = 0.0
    var number: String = "0"
    var secondNumber: Double = 0.0
    var result: Double = 0.0
    var tempNumber: Double? = 0.0
    var operation: String = ""
    var valueHasTyped = true
    
    
    func clearScreen(){
        resultLabelText.text = "0"
        firstNumber = 0.0
        number = "0"
        secondNumber = 0.0
        result = 0.0
        flag.state = 0
        tempNumber = 0.0
        operation = ""
        
        
    }
    
    struct calcFlags {
        var state: Int = 0
        var operation: Int = 0
        
    }
    public var flag = calcFlags()
    
    
   
    func storeNumber(value: String) {
        
       
        if flag.state == 0 {
            
            
            
            if resultLabelText.text == "0" && value == "."  {resultLabelText.text = "0"}
            else
            if resultLabelText.text == "0" {resultLabelText.text = ""}
            
            resultLabelText.text?.append(value)
            
           
            firstNumber = Double(resultLabelText.text ?? "") ?? 0
           
            
        }
        
        
        else
        if flag.state == 1 && flag.operation == 1 {
            resultLabelText.text = ""
            resultLabelText.text?.append(value)
            
            secondNumber = Double(resultLabelText.text ?? "") ?? 0
          
            flag.operation = 0
        }
        
        else
        if flag.state == 1 && flag.operation == 0 {
        
            resultLabelText.text?.append(value)
            
            secondNumber = Double(resultLabelText.text ?? "") ?? 0
        }
    }

   
    @IBOutlet weak var resultLabelText: UILabel!
    
  
    func printFinalResultToLabel(result: Double){
        print(resultLabelText.text = String(result))
    }
   
    
    @IBAction func clearBtnPressed(_ sender: Any) {
        clearScreen()
    }
    
    
    
    @IBAction func numberBtnPressed(_ sender: UIButton) {
        if let value = sender.titleLabel?.text {
    
        storeNumber(value: value)
        }
    }
    
    
    
    @IBAction func decimalBtnPressed(_ sender: Any) {
        storeNumber(value: ".")
    }
    
    @IBAction func operationBtnPressed(_ sender: UIButton) {
        if let value = sender.titleLabel?.text {
            
        operation = value
        }
        flag.state = 1
        flag.operation = 1
    }
    
    
    
    @IBAction func equalBtn(_ sender: Any) {
      
        switch operation {
        case "+":
            result = firstNumber + secondNumber
        case "-":
            result = firstNumber - secondNumber
        case "x":
            
            result = firstNumber * secondNumber
            
        case "/":
            result = firstNumber / secondNumber
        default:
            break
                
        }
        
        
        printFinalResultToLabel(result: result)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearScreen()
        // Do any additional setup after loading the view.
    }
    
}

