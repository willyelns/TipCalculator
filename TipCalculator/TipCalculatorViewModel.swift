//
//  TipCalculatorViewModel.swift
//  TipCalculator
//
//  Created by Will Germano on 16/10/21.
//

import Foundation

final class TipCalculatorViewModel: ObservableObject {
    
    
    @Published var checkAmount = ""
    @Published var numberOfPeople = 2
    @Published var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var subTotal: Double { Double(checkAmount) ?? 0}
    
    var subTotalPerPerson: Double {
        let peopleCount = Double(numberOfPeople)
        let orderAmount = Double(checkAmount) ?? 0
        
        return orderAmount / peopleCount
    }
    
    var tipValue: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        return orderAmount / 100 * tipSelection
    }
    
    var tipValuePerPerson: Double { tipValue / Double(numberOfPeople) }
    
    var totalAmountWithTip: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople)
        let amountPerPerson = totalAmountWithTip / peopleCount
        
        return amountPerPerson
    }
}
