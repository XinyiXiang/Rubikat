//
//  BlockCell.swift
//  Rubikat
//
//  Created by Vicky Xiang on 3/24/21.
//

import Foundation
import SwiftUI

struct Row: Identifiable {
    let id = UUID()
    let blocks: [Block]
}

extension Row {
    static func create() -> [Row] {
        return [
            Row(blocks: [Block(), Block(),Block(),Block(),Block()]),
            Row(blocks: [Block(), Block(),Block(),Block(),Block()]),
            Row(blocks: [Block(), Block(),Block(),Block(),Block()]),
            Row(blocks: [Block(), Block(),Block(),Block(),Block()]),
            Row(blocks: [Block(), Block(),Block(),Block(),Block()])
        ]
    }
}

struct Block: Identifiable{
    let id = UUID()
}
