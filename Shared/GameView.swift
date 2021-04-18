//
//  GameView.swift
//  Rubikat
//
//  Created by Vicky Xiang on 4/13/21.
//

import SwiftUI
import CoreGraphics

struct DraggableRect : View {
    var rowId: Int
    var colId: Int
    
    var colorsDict = ([[Color]](repeating: [Color.red, Color.blue, Color.yellow, Color.green, Color.orange, Color.purple], count: 4).flatMap{$0} + [Color.clear]).shuffled()
    
    @GestureState
    var position = CGSize.zero
    
    var body : some View {
        RoundedRectangle(cornerRadius: 20.0)
            .fill(colorsDict[rowId * 5 + colId])
            .animation(.spring())
            .offset(x: self.position.width, y: self.position.height)
            .gesture(
                DragGesture()
                    .updating($position, body: { value, state, transaction in
                                        state = value.translation
                    })
            )
    }
}

struct GameView: View {
    let grid = Grid.create()
    
    var sideLength: CGFloat = 60.0
    
    enum SwipeHorizontalDirection: String {
        case left, right, none
    }
    
    @State
    private var didShuffle: Bool = true
    
    var body: some View {
        VStack {
            if(self.didShuffle == false) {
                    ForEach(0..<5) {rowIndex in
                        HStack{
                            ForEach(0..<5) {colIndex in
                                VStack{
                                        DraggableRect(rowId: rowIndex, colId: colIndex)
                                            .frame(width: sideLength, height: sideLength)
                                }
                            }
                        }
                    }
                .padding(.bottom)
            }
            ShuffleButton(didShuffle: $didShuffle)
        }
    }
}

    


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
