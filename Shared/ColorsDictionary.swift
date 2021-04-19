//
//  ColorsDictionary.swift
//  Rubikat
//
//  Created by Vicky Xiang on 4/18/21.
//

import Foundation
import SwiftUI

struct ColorsDictionary {
    
}

extension ColorsDictionary {
    static func createShuffled(colorsCollection: [Color]) -> [Color] {
        return (([[Color]](repeating: colorsCollection, count: 4).flatMap{$0}).shuffled() + [Color.clear])
    }
}
