//
//  ColorsDictionary.swift
//  Rubikat
//
//  Created by Vicky Xiang on 4/18/21.
//

import Foundation
import SwiftUI

public struct ColorsDictionary {
    
}

extension ColorsDictionary {
    public static func createShuffled(colorsCollection: [Color]) -> [Color] {
        return (([[Color]](repeating: colorsCollection, count: 4).flatMap{$0}).shuffled() + [Color.clear])
    }
}
