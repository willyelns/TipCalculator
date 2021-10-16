//
//  CardView.swift
//  TipCalculator
//
//  Created by Will Germano on 07/10/21.
//

import SwiftUI

struct CardView: View {
    
    let cardLabelText: String
    var totalAmount: Double
    var subTotalAmount: Double
    var tipAmount: Double
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TitleView(title: cardLabelText)
            
            ZStack {
                Rectangle()
                    .foregroundColor(.gray)
                    .cornerRadius(20)
                
                HStack {
                    Spacer()
                    
                    Text("R$ \(totalAmount, specifier: "%.2f")")
                        .foregroundColor(.white)
                        .font(.system(size: 35, weight: .black, design: .monospaced))
                        .fontWeight(.black)
                    
                    Spacer()
                    
                    Rectangle()
                        .foregroundColor(Color(red: 128/255, green: 128/255, blue: 128/255))
                        .frame(width: 1, height: 70)
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        CardOption(title: "SUBTOTAL", value: subTotalAmount)
                        CardOption(title: "TIP", value: tipAmount)
                    }
                    .foregroundColor(.white)
                    
                    Spacer()
                }
                .padding(5)
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(cardLabelText: "PER PERSON", totalAmount: 48.58, subTotalAmount: 12.23, tipAmount: 6.23)
            .frame(width: 350, height: 150)
    }
}

struct CardOption: View {
    var title: String
    var value: Double
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(.caption, design: .rounded))
                .fontWeight(.light)
            Text("R$ \(value, specifier: "%.2f")")
                .font(.system(.body, design: .monospaced))
                .fontWeight(.black)
        }
    }
}
