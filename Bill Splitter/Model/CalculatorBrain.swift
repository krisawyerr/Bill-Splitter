//
//  CalculatorBrain.swift
//  Bill Splitter
//
//  Created by Kris Sawyerr on 8/29/24.
//

import Foundation

struct CalculatorBrain {
    var cost = 100.00
    var percent = 0.0
    var splitAmount = 1
    
    mutating func updatePrice(newPrice: String) {
        cost = Double(newPrice) ?? 0.00
    }
    
    mutating func updatePercent(newPercent: Double) {
        percent = newPercent
    }
    
    mutating func updateSplit(newSplit: Int) {
        splitAmount = newSplit
    }
}
