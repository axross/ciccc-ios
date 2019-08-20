//
//  AlertButton.swift
//  AutoLayoutSwiftUI
//
//  Created by Kohei Asai on 8/20/19.
//  Copyright © 2019 Kohei Asai. All rights reserved.
//

import SwiftUI

struct AlertButton: View {
    @State var isAlertShown = false
    
    var body: some View {
        Button(action: { self.isAlertShown = true }) {
            Rectangle()
        }
        .alert(isPresented: $isAlertShown, content: {
            Alert(
                title: Text("Are you okay?"),
                message: Text("I think you are okay.")
            )
        })
    }
}

struct AlertButton_Previews: PreviewProvider {
    static var previews: some View {
        AlertButton()
            .previewLayout(.fixed(width: 50, height: 50))
    }
}
