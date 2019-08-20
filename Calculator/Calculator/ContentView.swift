//
//  ContentView.swift
//  Calculator
//
//  Created by Kohei Asai on 8/20/19.
//  Copyright © 2019 Kohei Asai. All rights reserved.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .trailing, spacing: 0) {
                Spacer()
                Text("0")
                    .font(.system(size: 30))
                    .padding([.bottom, .trailing], 8)
                CalculatorKeyboard()
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.width / 4 * 5,
                        alignment: .bottom
                    )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
