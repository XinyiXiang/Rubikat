//
//  ColorsDictionary.swift
//  Rubikat
//
//  Created by Vicky Xiang on 4/16/21.
//
//
import Foundation
import SwiftUI

struct ColorsDictionary {
    let colors = [[Color]](repeating: [Color.red, Color.blue, Color.yellow, Color.green, Color.orange, Color.white], count: 4).flatMap{$0}
    
//    static func iterate() -> [Color] {
//        return colors
//    }
    
    static func index(id: Int) -> Int {
        return id + 1
    }
}



