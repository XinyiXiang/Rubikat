//
//  GameView.swift
//  Rubikat
//
//  Created by Vicky Xiang on 4/13/21.
//

import SwiftUI
import CoreGraphics


struct GameView: View {
    var colorsDict: [Color: Int] = [Color.red: 4,Color.blue: 4,Color.yellow: 4,Color.green: 4,Color.orange:4, Color.white:4]
    let randomColorIndex = shuffle()
    let rows = Row.create()
    
    @State
    private var didShuffle: Bool = true
    var sideLength: CGFloat = 60.0
    
    var body: some View {
        VStack {
            if(self.didShuffle == false) {
                ForEach(rows) { row in
                    HStack(alignment: .center) {
                        ForEach(row.blocks) { block in
                            RoundedRectangle(cornerRadius: 20.0)
                                .fill(Array(colorsDict)[randomColorIndex].key)
                                .frame(width: sideLength, height: sideLength)
                        }
                    }
                }
                .padding(.bottom)
            }
            ShuffleButton(didShuffle: $didShuffle)
        }
    }
    
    mutating func shuffle() -> Int {
       var randomColorIndex = Int.random(in: 0..<5)
       if(Array(colorsDict)[randomColorIndex].value == 0){
           randomColorIndex = shuffle()
       }
       else {
        let oldVal = Array(colorsDict)[randomColorIndex].value
        colorsDict.updateValue(oldVal, forKey: Array(colorsDict)[randomColorIndex].key)
        //forKey: Array(colorsDict)[randomColorIndex].key
       }
       return randomColorIndex
   }
}
    


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
