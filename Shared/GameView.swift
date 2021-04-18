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
    
    @State
    private var location = CGPoint(x:30,y:30)
    @GestureState
    var draggedOffset = CGSize.zero
    
    var body : some View {
        RoundedRectangle(cornerRadius: 20.0)
            .fill(colorsDict[rowId * 5 + colId])
            .position(location)
            .animation(.spring())
            .offset(x: self.draggedOffset.width, y: self.draggedOffset.height)
            .gesture(
                DragGesture().updating($draggedOffset, body: { value, state, transaction in state = value.translation})
                    .onEnded{ value in
                        if (abs(self.draggedOffset.width - 60.0) != 0) {
                            self.location = value.location
                        }
                        else if (abs(self.draggedOffset.height - 60.0) != 0) {
                            self.location = value.location
                        }
                        else {
                        }
                    })
    }
}

struct GameView: View {
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
