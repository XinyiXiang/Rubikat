//
//  Grid.swift
//  Rubikat
//
//  Created by Vicky Xiang on 3/24/21.
//

import Foundation
import SwiftUI

struct Grid: Identifiable {
    let id = UUID()
    let blocks: [Block]
}

extension Grid {
    static func create() -> [Block] {
        return
            [Block(index: 0), Block(index: 1),Block(index: 2),Block(index: 3),Block(index: 4),
            Block(index: 5), Block(index: 6),Block(index: 7),Block(index: 8),Block(index: 9)
//            ,Block(index: 10), Block(index: 11),Block(index: 12),Block(index: 13),Block(index: 14),
//            Block(index: 15), Block(index: 16),Block(index: 17),Block(index: 18),Block(index: 19),
//            Block(index: 20), Block(index: 21),Block(index: 22),Block(index: 23),Block(index: 24)
            ]
    }
}

struct Block: Identifiable{
    let id = UUID()
    let index: Int
}
