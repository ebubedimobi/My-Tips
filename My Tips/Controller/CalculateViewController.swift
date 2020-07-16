//
//  ViewController.swift
//  My Tips
//
//  Created by Ebubechukwu Dimobi on 08.07.2020.
//  Copyright © 2020 blazeapps. All rights reserved.
//
import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var billAmountLabel: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var calculatorBrain = CalculatorBrain()
    
    var PctClicked: Int?
    var splitNumber: Int = 2
    var billText: Float?
    var realPercentage: Int = 10
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        // tag determines the tip Percentage
        
        PctClicked = sender.tag
        billAmountLabel.endEditing(true)
        
        switch PctClicked {
        case 1:
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            realPercentage = 0
        case 2:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            realPercentage = 10
        case 3:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            realPercentage = 20
        default:
            print("Error")
        }
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        billAmountLabel.endEditing(true)  // ends uiText editing
        
        let stepperValue = sender.value
        splitNumber = Int(stepperValue)  //update splitnumber each time stepper is changed
        splitNumberLabel.text = String(splitNumber)
        
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        if billAmountLabel != nil{
            billText = Float(billAmountLabel.text!)
            print(billText ?? "Error Message")
            
            calculatorBrain.calculculateTip(billTotal: billText ?? 0, tipPercentage: realPercentage, splitNumber: splitNumber)
        }else {

            print("Error Message")
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            
            let resultViewController = segue.destination as! ResultViewController
            
            resultViewController.information = calculatorBrain.getText()
            resultViewController.splitAmount = calculatorBrain.getTipAmount()
            
        }
    }
    
}

