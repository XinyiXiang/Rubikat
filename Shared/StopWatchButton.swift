//
//  StopWatchButton.swift
//  Rubikat
//
//  Created by Vicky Xiang on 4/18/21.
//  The template of this file is provided by Darren Leak.
//  https://github.com/programmingwithswift/SwiftUIStopWatch

import Foundation
import SwiftUI

struct StopWatchButton : View {
    public var actions: [() -> Void]
    public var labels: [String]
    public var color: Color
    public var isPaused: Bool
    
    public var body: some View {
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
