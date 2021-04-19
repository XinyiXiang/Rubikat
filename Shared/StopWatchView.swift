//
//  StopWatchView.swift
//  Rubikat
//
//  Created by Vicky Xiang on 4/18/21.
//

import SwiftUI

struct StopWatchView: View {
    @ObservedObject
    var stopWatch = StopWatch()
    
    var body: some View {
        VStack{
        Text(self.stopWatch.stopWatchTime)
            .font(.custom("courier", size: 70))
            .foregroundColor(Color.gray)
            .frame(width: UIScreen.main.bounds.size.width,
                   height: 40,
                   alignment: .center)
            .padding(.bottom)
            HStack{
                StopWatchButton(actions: [self.stopWatch.reset, self.stopWatch.lap],
                                labels: ["Reset", "Lap"],
                                color: Color.red,
                                isPaused: self.stopWatch.isPaused())
                    .cornerRadius(15.0)
                StopWatchButton(actions: [self.stopWatch.start, self.stopWatch.pause],
                                labels: ["Start", "Pause"],
                                color: Color.blue,
                                isPaused: self.stopWatch.isPaused())
                    .cornerRadius(15.0)
            }
        }
        
        }
}

struct StopWatchView_Previews: PreviewProvider {
    static var previews: some View {
        StopWatchView()
    }
}
