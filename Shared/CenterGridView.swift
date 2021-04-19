//
//  CenterGridView.swift
//  Rubikat
//
//  Created by Vicky Xiang on 4/18/21.
//

import SwiftUI

struct CenterGridView: View {
    public var sideLength: CGFloat = 20.0
    public var body: some View {
        VStack{
            ForEach(0..<3) {rowIndex in
                HStack{
                    ForEach(0..<3) {colIndex in
                        VStack{
                            DraggableRect(rowId: rowIndex, colId: colIndex)
                                .frame(width: sideLength, height: sideLength, alignment: .leading)
                        }
                    }
                }
            }
            .padding(.bottom)
        }
        .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
    }
}

struct CenterGridView_Previews: PreviewProvider {
    static var previews: some View {
        CenterGridView()
    }
}
