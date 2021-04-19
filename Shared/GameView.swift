//
//  GameView.swift
//  Rubikat
//
//  Created by Vicky Xiang on 4/13/21.
//

import SwiftUI
import CoreGraphics

public struct DraggableRect : View {
    var rowId: Int
    var colId: Int
    
    let colorsDict:[Color] = ColorsDictionary.createShuffled(colorsCollection: [Color.red, Color.blue, Color.yellow, Color.green, Color.orange, Color.purple])
    
    @State
    private var location = CGPoint(x:30,y:30)
    
    @GestureState
    var draggedOffset = CGSize.zero
    
    public var body : some View {
        RoundedRectangle(cornerRadius: 20.0)
            .fill(colorsDict[rowId * 5 + colId])
            .position(location)
            .animation(.spring())
            .offset(x: self.draggedOffset.width, y: self.draggedOffset.height)
            .gesture(
                DragGesture()
                    .updating($draggedOffset, body: { value, state, transaction in
                                        state = value.translation})
                    .onEnded{ value in
                        if (abs(value.location.x - self.location.x) > 60.0) {
                            if(value.location.x - self.location.x > 60.0){
                                self.location.x = CGFloat(self.location.x + 67.5)
                            }
                            else if (value.location.x - self.location.x < -60.0){
                                self.location.x = CGFloat(self.location.x - 67.5)
                            }
                        }
                        else if (abs(value.location.y - self.location.y) > 60.0) {
                            if(value.location.y - self.location.y > 60.0){
                                self.location.y = CGFloat(self.location.y + 95.0)
                            }
                            else if (value.location.y - self.location.y < -60.0){
                                self.location.y = CGFloat(self.location.y - 95.0)
                            }
                        }
                    })
    }
}

public struct GridView: View {
    var sideLength: CGFloat = 60.0
    
    public var body: some View {
        ForEach(0..<5) {rowIndex in
            HStack{
                ForEach(0..<5) {colIndex in
                    VStack{
                        DraggableRect(rowId: rowIndex, colId: colIndex)
                            .frame(width: sideLength, height: sideLength, alignment: .leading)
                    }
                }
            }
        }
        .padding(.bottom)
    }
}


public struct GameView: View {
    @State
    private var didShuffle: Bool = true
    @State
    private var showGameTitle: Bool = true
   
    
    public var body: some View {
        ZStack{
            if(self.didShuffle == false) {
                Rectangle()
                    .stroke(Color.gray, lineWidth: 5.0)
                    .foregroundColor(Color.clear)
                    .frame(width: 205, height: 240, alignment: .center)
                    .position(x: 195, y: 400)
            }
            
            VStack {
                if(self.didShuffle == false) {
                    StopWatchView()
                    GridView()
                        .frame(width: 90, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                if self.showGameTitle {
                    VStack{
                        HStack{
                            Text("😻")
                            Text("😾")
                            Text("🧩")
                            Text("🙀")
                            Text("😸")
                        }
                        .font(.system(size: 50))
                        .animation(.easeIn)
                        GameTitle()
                    }
                }
                ShuffleButton(didShuffle: $didShuffle, showGameTitle: $showGameTitle,labels: ["Start","Shuffle"])
            }
        }
    }
}

    


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
