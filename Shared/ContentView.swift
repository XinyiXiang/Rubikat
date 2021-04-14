//
//  ContentView.swift
//  Shared
//
//  Created by Vicky Xiang on 3/23/21.
//

import SwiftUI
import CoreGraphics


struct BlocksView: View {
    @State private var randomColor = Color.green
    var sideLength: CGFloat = 60
    
    let rows = Row.create()
    let colorsDict: [Color: Int] = [Color.red: 4,Color.blue: 4,Color.yellow: 4,Color.green: 4,Color.orange:4, Color.white:4]
    
    var body: some View {
        VStack {
            ForEach(rows) { row in
                HStack(alignment: .center) {
                    ForEach(row.blocks) { block in
                        RoundedRectangle(cornerRadius: 20.0)
                            .fill(Array(colorsDict)[shuffle()].key)
                            .frame(width: sideLength, height: sideLength)
                    }
                }
            }
            .padding(.bottom)
            Button(action: {
                self.randomColor = Array(colorsDict)[shuffle()].key
                print("Blocks Shuffled")
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
    
    func shuffle() -> Int {
        let randomColorIndex = Int.random(in: 0..<5)
        return randomColorIndex
    }
}

struct ContentView: View {
    
    var body: some View {
        BlocksView()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
