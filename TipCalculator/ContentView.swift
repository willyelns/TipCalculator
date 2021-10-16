//
//  ContentView.swift
//  TipCalculator
//
//  Created by Will Germano on 07/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @FocusState private var isInputActive: Bool
    @StateObject private var viewModel = TipCalculatorViewModel()
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(.indigo)
    }
    
    var body: some View {
        GeometryReader{ geo in
            VStack(alignment: .center, spacing: 20) {
                CardView(cardLabelText: "PER PERSON", totalAmount: viewModel.totalPerPerson, subTotalAmount: viewModel.subTotalPerPerson, tipAmount: viewModel.tipValuePerPerson)
                    .frame(width: geo.size.width, height: 100)
                CardView(cardLabelText: "TOTAL", totalAmount: viewModel.totalAmountWithTip, subTotalAmount: viewModel.subTotal, tipAmount: viewModel.tipValue)
                    .frame(width: geo.size.width, height: 100)
                
                Picker("Tip Percentage", selection: $viewModel.tipPercentage) {
                    ForEach(0..<viewModel.tipPercentages.count) {
                        Text("\(self.viewModel.tipPercentages[$0])%")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                TitleView(title: "BILL AMOUNT")
                
                HStack {
                    Text("R$")
                        .foregroundColor(.primary)
                        .font(.system(size: 60, weight: .black, design: .rounded))
                        
                    TextField("Amount", text: $viewModel.checkAmount)
                        .foregroundColor(.primary)
                        .font(.system(size: 60, weight: .black, design: .rounded))
                        .keyboardType(.decimalPad)
                        .focused($isInputActive)
                    
                        .toolbar{
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                                Button("Done") {
                                    isInputActive = false
                                }
                            }
                        }
                }
                TitleView(title: "SPLIT")
                GuestCountView(guestCount: $viewModel.numberOfPeople)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}


