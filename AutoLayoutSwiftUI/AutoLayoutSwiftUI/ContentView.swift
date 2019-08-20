//
//  ContentView.swift
//  AutoLayoutSwiftUI
//
//  Created by Kohei Asai on 8/20/19.
//  Copyright © 2019 Kohei Asai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(alignment: .trailing) {
                    HStack {
                        Spacer()
                        HStack(alignment: .center, spacing: 10) {
                            Rectangle()
                                .frame(width: 70, height: 30)
                                .foregroundColor(.orange)
                            Rectangle()
                                .frame(width: 50, height: 30)
                                .foregroundColor(.orange)
                        }
                        .padding(10)
                        .background(
                            Rectangle().foregroundColor(.red)
                        )
                    }
                    Spacer()
                }
                .padding(.top, 20)
                .padding(.trailing, 20)
                VStack(alignment: .center) {
                    Spacer()
                    Rectangle()
                        .frame(width: 50, height: 50)
                    Spacer()
                    AlertButton()
                        .frame(width: 50, height: 50)
                    Spacer()
                    Rectangle()
                        .frame(width: 50, height: 50)
                    Spacer()
                }
                .foregroundColor(.blue)
                VStack(alignment: .trailing) {
                    Spacer()
                    HStack {
                        Spacer()
                        Rectangle()
                            .frame(minWidth: 200, maxWidth: geometry.size.width * 0.61, maxHeight: 50, alignment: .bottomTrailing)
                            .foregroundColor(.purple)
                    }
                }
                .padding(.bottom, 20)
                .padding(.trailing, 20)
            }
            .frame(
                width: geometry.size.width,
                height: nil,
                alignment: .topLeading
            )
            .background(Rectangle().foregroundColor(.green))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice(PreviewDevice(stringLiteral: "iPhone XS"))
                .previewDisplayName("iPhone XS")
            ContentView()
                .previewDevice(PreviewDevice(stringLiteral: "iPhone 8"))
                .previewDisplayName("iPhone 8")
        }
    }
}
