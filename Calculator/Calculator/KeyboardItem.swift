//
//  GrayKey.swift
//  Calculator
//
//  Created by Kohei Asai on 8/20/19.
//  Copyright © 2019 Kohei Asai. All rights reserved.
//

import SwiftUI

struct KeyboardItem<Content>: View where Content: View {
    public init(
        action: @escaping () -> Void,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.action = action
        self.content = content
    }
    
    var action: () -> Void
    
    var content: () -> Content
    
    var body: some View {
        Button(action: action) {
            content()
        }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}

struct KeyboardItem_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardItem(action: {}) {
            Text("1")
        }.previewLayout(.fixed(width: 100, height: 100))
    }
}
