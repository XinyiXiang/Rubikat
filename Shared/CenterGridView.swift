//
//  CenterGridView.swift
//  Rubikat
//
//  Created by Vicky Xiang on 4/18/21.
//

import SwiftUI

struct CenterGridView: View {
    var sideLength: CGFloat = 10.0
    var body: some View {
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
        .frame(width: 30, height: 30, alignment: .center)
    }
}

struct CenterGridView_Previews: PreviewProvider {
    static var previews: some View {
        CenterGridView()
    }
}

