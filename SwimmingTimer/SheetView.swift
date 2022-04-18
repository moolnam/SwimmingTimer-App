//
//  SheetView.swift
//  SwimmingTimer
//
//  Created by KimJongHee on 2022/01/17.
//

import SwiftUI

struct SheetView: View {
    
    @Binding var isSheet: Bool
    
    @Binding var circleMeter: CGFloat
    @Binding var circleCount: CGFloat
    @Binding var circleCycle: CGFloat
    
    @Binding var stepperMeter: CGFloat
    @Binding var stepperCount: CGFloat
    @Binding var stepperCycle: CGFloat

    
    @State private var sheetCount = 5
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            VStack {
                Text("\(Int(stepperCount)) / \(Int(circleCount))")
                    .fontWeight(.bold)
                    .font(.system(size: 50))
                    .foregroundColor(Color.red)
                Text("\(Int(stepperCycle)) / \(Int(circleCycle))")
                    .fontWeight(.bold)
                    .font(.system(size: 50))
                    .foregroundColor(Color.blue)
            }
            Text("\(sheetCount)")
                .font(.system(size: 500))
                .fontWeight(.heavy)
                .foregroundColor(Color.blue)
                .onReceive(timer) { time in
                    if isSheet {
                        withAnimation {
                            sheetCount -= 1
                        }
                        if sheetCount == 0 {
                            isSheet = false
                        }
                    }
                }
        }
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView(isSheet: .constant(false), circleMeter: .constant(0), circleCount: .constant(0), circleCycle: .constant(0), stepperMeter: .constant(0), stepperCount: .constant(0), stepperCycle: .constant(0))
    }
}
