//
//  ContentView.swift
//  Shared
//
//  Created by Vicky Xiang on 3/23/21.
//

import SwiftUI
import CoreGraphics


struct ContentView: View {
    var body: some View {
        ZStack{
            if #available(iOS 14.0, *) {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.purple,Color.white,Color.yellow]), startPoint: .top, endPoint: .bottom))
                    .ignoresSafeArea()
            } else {
                // Fallback on earlier versions
                Rectangle()
                    .fill(Color.yellow)
            }
            GameView()
                .offset(y:35)
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
