//
//  ShuffleButton.swift
//  Rubikat
//
//  Created by Vicky Xiang on 4/13/21.
//

import SwiftUI

struct ShuffleButton: View {
    @Binding
    var didShuffle: Bool
    var labels: [String]
    var body: some View {
        
        Button(action: {
            self.didShuffle.toggle()
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
    }
}

