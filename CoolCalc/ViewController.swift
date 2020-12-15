//
//  ViewController.swift
//  CoolCalc
//
//  Created by Karakatsanis Georgios on 5/5/20.
//  Copyright © 2020 All rights reserved.
//

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
        //finalResult = 0
        flag.state = 0
        tempNumber = 0.0
        operation = ""
        
        
        
    }
    
    struct calcFlags {
        var state: Int = 0
        //var pentingValue: Double = 0.00
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
    
    
    
    @IBAction func numberOneBtnPressed(_ sender: Any) {
        storeNumber(value: "1")
        
    }
    
    @IBAction func numberTwoBtnPressed(_ sender: Any) {
        storeNumber(value: "2")
        
    }
    
    @IBAction func numberThreeBtnPressed(_ sender: Any) {
        storeNumber(value: "3")
    }
    
    @IBAction func numberFourBtnPressed(_ sender: Any) {
        storeNumber(value: "4")
    }
    
    
    @IBAction func numberFiveBtnPressed(_ sender: Any) {
        storeNumber(value: "5")
    }
    
    
    @IBAction func numberSixButtonPressed(_ sender: Any) {
        storeNumber(value: "6")
    }
    
    
    @IBAction func numberSevenBtnPressed(_ sender: Any) {
        storeNumber(value: "7")
    }
    @IBAction func numberEightBtnPressed(_ sender: Any) {
        storeNumber(value: "8")
    }
    
    
    @IBAction func numberNineBtnPressed(_ sender: Any) {
        storeNumber(value: "9")
    }
    
    
    @IBAction func numberZeroBtnPressed(_ sender: Any) {
        storeNumber(value: "0")
    }
    
 
    
    @IBAction func decimalBtnPressed(_ sender: Any) {
        storeNumber(value: ".")
    }
    
    @IBAction func plusBtn(_ sender: Any) {
       
        operation = "+"
    
        flag.state = 1
        flag.operation = 1
    }
    
    
    @IBAction func minusBtn(_ sender: Any) {
        
        operation = "-"
        flag.state = 1
        flag.operation = 1
    }
    
    
    @IBAction func multiplyBtn(_ sender: Any) {
        operation = "*"
        flag.state = 1
        flag.operation = 1
    }
    
    
    @IBAction func divideBtn(_ sender: Any) {
        operation = "/"
        flag.state = 1
        flag.operation = 1
    }
    
    
    
    
    @IBAction func equalBtn(_ sender: Any) {
        //print(firstNumber)
       // print(secondNumber)
        
        if operation == "+" {
            result = firstNumber + secondNumber
        }
        
        if operation == "-" {
            result = firstNumber - secondNumber
        }
        
        if operation == "*" {
            result = firstNumber * secondNumber
        }
        
        if operation == "/" {
            result = firstNumber / secondNumber
        }
        
        
        printFinalResultToLabel(result: result)
        
        
    }
    
    @IBAction func percent100(_ sender: Any) {
        result = firstNumber * (1 / 100)
        printFinalResultToLabel(result: result)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearScreen()
        // Do any additional setup after loading the view.
    }
    
}

