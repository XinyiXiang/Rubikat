//
//  StopWatchButton.swift
//  Rubikat
//
//  Created by Vicky Xiang on 4/18/21.
//

import Foundation
import SwiftUI

struct StopWatchButton : View {
    var actions: [() -> Void]
    var labels: [String]
    var color: Color
    var isPaused: Bool
    
    var body: some View {
        let buttonWidth = (UIScreen.main.bounds.size.width / 4) - 12
        
        return Button(action: {
            if self.isPaused {
                self.actions[0]()
            } else {
                self.actions[1]()
            }
        }) {
            if isPaused {
                Text(self.labels[0])
                    .foregroundColor(Color.white)
                    .frame(width: buttonWidth,
                           height: 30)
            } else {
                Text(self.labels[1])
                    .foregroundColor(Color.white)
                    .frame(width: buttonWidth,
                           height: 30)
            }
        }
        .background(self.color)
    }
}
