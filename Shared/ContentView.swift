//
//  ContentView.swift
//  Shared
//
//  Created by Vicky Xiang on 3/23/21.
//

import SwiftUI

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
    var sideLength: CGFloat = 60
    @State private var randomColor : Color = .green
    
    let rows = Row.create()
    let colors: KeyValuePairs = ["red": 4,"blue": 4,"yellow": 4,"green": 4,"orange":4 ,"white":4]
    
    var body: some View {
        VStack {
            ForEach(rows) { row in
                HStack(alignment: .center) {
                    ForEach(row.blocks) { block in
                        RoundedRectangle(cornerRadius: 20.0)
                            //TODO: Make blocks fill in random colors
                            .fill(randomColor)
                            .frame(width: sideLength, height: sideLength)
                    }
                }
            }
            
            Button(action: {
                // self.randomColor = colors[shuffle()]
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
        //let blockBoard = Block.chunked(into: 5)
        
        BlocksView().padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
