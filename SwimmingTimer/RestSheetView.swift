//
//  RestSheetView.swift
//  SwimmingTimer
//
//  Created by KimJongHee on 2022/01/17.
//

import SwiftUI

struct RestSheetView: View {
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @Binding var isRestSheet: Bool
    
    @Binding var stepperCycle: CGFloat
    
    @State private var restSheetCount = 10
    
    var body: some View {
        VStack {
            Text("Ready")
                .font(.system(size: 100))
                .fontWeight(.heavy)
                .foregroundColor(Color.yellow)
            Text("\(restSheetCount)")
                .font(.system(size: 300))
                .fontWeight(.heavy)
                .foregroundColor(Color.yellow)
            .onReceive(timer) { time in
                if isRestSheet {
                    withAnimation {
                        restSheetCount -= 1
                    }
                    if restSheetCount == 0 {
                        isRestSheet = false
                    }
                }
            }
        }
    }
}

struct RestSheetView_Previews: PreviewProvider {
    static var previews: some View {
        RestSheetView(isRestSheet: .constant(false), stepperCycle: .constant(0))
    }
}
