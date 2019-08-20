//
//  Keyboard.swift
//  Calculator
//
//  Created by Kohei Asai on 8/20/19.
//  Copyright © 2019 Kohei Asai. All rights reserved.
//

import SwiftUI

struct CalculatorKeyboard: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 1) {
                HStack(spacing: 1) {
                    KeyboardItem("Clear", color: .gray, action: {})
                    KeyboardItem("+/-", color: .gray, action: {})
                    KeyboardItem("%", color: .gray, action: {})
                    KeyboardItem("+", color: .red, action: {})
                }
                    .frame(minHeight: 0, maxHeight: .infinity)
                HStack(spacing: 1) {
                    KeyboardItem("7", action: {})
                    KeyboardItem("8", action: {})
                    KeyboardItem("9", action: {})
                    KeyboardItem("x", color: .red, action: {})
                }
                    .frame(minHeight: 0, maxHeight: .infinity)
                HStack(spacing: 1) {
                    KeyboardItem("4", action: {})
                    KeyboardItem("5", action: {})
                    KeyboardItem("6", action: {})
                    KeyboardItem("-", color: .red, action: {})
                }
                    .frame(minHeight: 0, maxHeight: .infinity)
                HStack(spacing: 1) {
                    KeyboardItem("1", action: {})
                    KeyboardItem("2", action: {})
                    KeyboardItem("3", action: {})
                    KeyboardItem("+", color: .red, action: {})
                }
                    .frame(minHeight: 0, maxHeight: .infinity)
                HStack(spacing: 1) {
                    KeyboardItem("0", action: {})
                    HStack(spacing: 1) {
                        KeyboardItem(".", action: {})
                        KeyboardItem("=", color: .red, action: {})
                    }.frame(minHeight: 0, maxHeight: .infinity)
                }
                    .frame(minHeight: 0, maxHeight: .infinity)
            }
            .frame(width: geometry.size.width)
        }
    }
}

struct CalculatorKeyboard_Preview: PreviewProvider {
    static var previews: some View {
        CalculatorKeyboard()
            .previewLayout(.fixed(width: 400, height: 500))
    }
}

struct KeyboardItem: View {
    public init(
        _ label: String,
        color: KeyboardItemColor = .normal,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.color = color
        self.action = action
    }
    
    let label: String
    
    let action: () -> Void
    
    let color: KeyboardItemColor
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.system(size: 20))
                .foregroundColor(foregroundColor)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(backgroundColor)
    }
    
    var foregroundColor: Color {
        get {
            switch color {
                case .normal:
                    return Color.black
                case .gray:
                    return Color.white
                case .red:
                    return Color.white
            }
        }
    }
    
    var backgroundColor: Color {
        get {
            switch color {
                case .normal:
                    return Color(red: 200 / 255, green: 214 / 255, blue: 229 / 255)
                case .gray:
                    return Color(red: 87 / 255, green: 101 / 255, blue: 116 / 255)
                case .red:
                    return Color(red: 238 / 255, green: 82 / 255, blue: 83 / 255)
            }
        }
    }
}

struct KeyboardItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            KeyboardItem("1", action: {})
                .previewLayout(.fixed(width: 100, height: 100))
            KeyboardItem("1", color: .gray, action: {})
                .previewLayout(.fixed(width: 100, height: 100))
            KeyboardItem("1", color: .red, action: {})
                .previewLayout(.fixed(width: 100, height: 100))
        }
    }
}

enum KeyboardItemColor {
    case normal
    case gray
    case red
}
