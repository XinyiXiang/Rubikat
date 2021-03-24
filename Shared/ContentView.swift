//
//  ContentView.swift
//  Shared
//
//  Created by Vicky Xiang on 3/23/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        HStack{
            ForEach(0..<5) { row in
                VStack{
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(Color.green)
                        .frame(width: 70, height: 70)
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(Color.green)
                        .frame(width: 70, height: 70)
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(Color.green)
                        .frame(width: 70, height: 70)
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(Color.green)
                        .frame(width: 70, height: 70)
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(Color.green)
                        .frame(width: 70, height: 70)
                }
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
