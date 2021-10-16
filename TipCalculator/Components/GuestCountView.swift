//
//  GuestCountView.swift
//  TipCalculator
//
//  Created by Will Germano on 07/10/21.
//

import SwiftUI

struct GuestCountView: View {
    @Binding var guestCount: Int
        
    var body: some View {
        HStack(spacing: 20) {
            Button {
                if guestCount > 1 {
                    guestCount -= 1
                }
            } label: {
                ButtonLabel(icon: "minus.circle")
            }
            
            Text("\(guestCount)")
                .foregroundColor(.primary)
                .font(.system(size: 40, weight: .black, design: .monospaced))
            
            Button {
                guestCount += 1
            } label: {
                ButtonLabel(icon: "plus.circle")
            }
        }
    }
}

struct GuestCountView_Previews: PreviewProvider {
    static var previews: some View {
        GuestCountView(guestCount: .constant(1))
            .preferredColorScheme(.dark)
    }
}

struct ButtonLabel: View {
    let icon: String
    
    var body: some View {
        Image(systemName: icon)
            .foregroundColor(.indigo)
            .font(.system(.title, design: .rounded))
    }
}
