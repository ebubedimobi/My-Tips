//
//  CalculatorBrain.swift
//  My Tips
//
//  Created by Ebubechukwu Dimobi on 08.07.2020.
//  Copyright © 2020 blazeapps. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var tipsy: Tipsy?
    
    mutating func calculculateTip(billTotal: Float, tipPercentage: Int, splitNumber: Int){
        
        let realPercentage = Float(tipPercentage) / 100.0
        
        let amount = ( realPercentage * billTotal ) / Float(splitNumber)
        let roundedupAmount = String(format: "%.2f", amount)
        let totalBillAmountPerPerson = String(format: "%.2f", (billTotal + amount * Float(splitNumber))/Float(splitNumber))
        
        let text = "Total amount per person = \(totalBillAmountPerPerson), includes tip of \(tipPercentage)% split between \(splitNumber) people."
        
        tipsy = Tipsy(tipAmount: roundedupAmount, text: text)
    }
    
    func getTipAmount() -> String{
        
        return tipsy?.tipAmount ?? "Error Message! Recalculate"
    }
    
    func getText() -> String{
        
        return tipsy?.text ?? "We encounterd an error, please recalculate"
    }
    
    
}
