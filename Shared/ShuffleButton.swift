//
//  ShuffleButton.swift
//  Rubikat
//
//  Created by Vicky Xiang on 4/13/21.
//

import SwiftUI

struct ShuffleButton: View {
    @Binding var didShuffle: Bool
        
    var body: some View {
        
        Button(action: {
            self.didShuffle.toggle()
        }){
            HStack{
                Image(systemName: "shuffle")
                Text("Shuffle")
                    .bold()
            }
            .foregroundColor(Color.white)
            .background(Color.yellow)
            .font(.largeTitle)
            .cornerRadius(5.0)
        }
    }
}

