//
//  ContentView.swift
//  Shared
//
//  Created by Vicky Xiang on 3/23/21.
//

import SwiftUI
import CoreGraphics

extension Array {
    func chunked(into size:Int) -> [[Element]]{
        var blockArray = [[Element]]()
    
        for index in 0..<self.count{
            if (index % size == 0 && index != 0) {
                blockArray.append(Array(self[(index - size)..<index]))
            }
            else if(index == self.count){
                blockArray.append(Array(self[index - 1..<index]))
            }
        }
        
        return blockArray
    }
}

struct BlocksView: View {
    @State private var randomColor = Color.green
    var sideLength: CGFloat = 60
    
    let rows = Row.create()
    let colorsDict: [Color: Int] = [Color.red: 4,Color.blue: 4,Color.yellow: 4,Color.green: 4,Color.orange:4, Color.clear:4]
    
    var body: some View {
        VStack {
            ForEach(rows) { row in
                HStack(alignment: .center) {
                    ForEach(row.blocks) { block in
                        RoundedRectangle(cornerRadius: 20.0)
                            .fill(randomColor)
                            .frame(width: sideLength, height: sideLength)
                    }
                }
            }
            
            Button(action: {
                self.randomColor = Array(colorsDict)[0].key
            }, label: {
                Text("Shuffle")
                    .foregroundColor(.white)
                    .bold()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            })
            .background(Color.yellow)
            .cornerRadius(5.0)
            .padding()
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
            .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
