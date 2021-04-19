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
        VStack{
            
            GameView()
                .offset(y:50)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
