//
//  GameView.swift
//  Rubikat
//
//  Created by Vicky Xiang on 4/13/21.
//

import SwiftUI
import CoreGraphics

struct IterateColorDictionary: Sequence, IteratorProtocol {
    var colorsDict = [[Color]](repeating: [Color.red, Color.blue, Color.yellow, Color.green, Color.orange, Color.white], count: 4).flatMap{$0}
    var start: Int
    
    mutating func next() -> Color? {
        if start == 0 {
            return Color.black
        }
        else {
            defer {
                start -= 1
            }
            return colorsDict[start]
        }
    }
    
    
}

struct GameView: View {
    let grid = Grid.create()
    
    var sideLength: CGFloat = 60.0
    var colorsDict = ([[Color]](repeating: [Color.red, Color.blue, Color.yellow, Color.green, Color.orange, Color.purple], count: 4).flatMap{$0} + [Color.clear]).shuffled()
    
    enum SwipeHorizontalDirection: String {
        case left, right, none
    }
    
    @State
    private var didShuffle: Bool = true
    @State
    var swipeHorizontalDirection: SwipeHorizontalDirection = .none {
        didSet { print(swipeHorizontalDirection) } }
    @State
    var draggedOffset = CGSize.zero
    
    var body: some View {
        VStack {
            if(self.didShuffle == false) {
                    ForEach(0..<5) {rowIndex in
                        HStack{
                            ForEach(0..<5) {colIndex in
                                VStack{
                                    RoundedRectangle(cornerRadius: 20.0)
                                        .fill(colorsDict[rowIndex * 5 + colIndex])
                                        .frame(width: sideLength, height: sideLength)
                                        // drag animation
                                        .animation(.spring())
                                        .offset(x: self.draggedOffset.width, y: self.draggedOffset.height)
                                        .gesture(DragGesture()
                                            .onChanged { value in
                                                self.draggedOffset = value.translation
                                            }
                                            .onEnded { value in
                                                self.draggedOffset = CGSize.zero
                                            }
                                        )
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
