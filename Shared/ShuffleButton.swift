//
//  ShuffleButton.swift
//  Rubikat
//
//  Created by Vicky Xiang on 4/13/21.
//

import SwiftUI

struct GameTitle: View {
    var body: some View {
        Text("Rubikat")
            .font(.custom("OpenSans-Bold", size: 70))
            .bold()
            .foregroundColor(Color.purple)
    }
}

struct ShuffleButton: View {
    @Binding
    var didShuffle: Bool
    @Binding
    var showGameTitle: Bool
    var labels: [String]
    
    public var body: some View {
//        VStack{
            Button(action: {
                self.didShuffle.toggle()
                self.showGameTitle.toggle()
            }){
                HStack{
                    if didShuffle{
                        Image(systemName: "gamecontroller")
                        Text(labels[0])
                            .bold()
                    }
                    else {
                        Image(systemName: "shuffle")
                        Text(labels[1])
                            .bold()
                    }
                }
                .foregroundColor(Color.white)
                .background(Color.yellow)
                .font(.largeTitle)
                .cornerRadius(5.0)
            }
        //}
    }
}

