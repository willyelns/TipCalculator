//
//  TitleView.swift
//  TipCalculator
//
//  Created by Will Germano on 07/10/21.
//

import SwiftUI

struct TitleView: View {
    var title: String
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.indigo)
                .fontWeight(.black)
            Spacer()
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "PER PERSON")
    }
}
