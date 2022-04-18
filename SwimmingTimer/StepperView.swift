//
//  StepperView.swift
//  SwimmingTimer
//
//  Created by KimJongHee on 2022/01/17.
//

import SwiftUI

struct StepperView: View {
    
    @Binding var stepperMeter: CGFloat
    @Binding var stepperCount: CGFloat
    @Binding var stepperCycle: CGFloat
    
    var body: some View {
        VStack {
            Stepper("\(Int(stepperMeter)) 미터", value: $stepperMeter, in: 0...10000, step: 25)
                .foregroundColor(Color.black)
            Stepper("\(Int(stepperCount)) 개", value: $stepperCount, in: 0...100, step: 1)
                .foregroundColor(Color.black)
            Stepper("\(Int(stepperCycle)) 초", value: $stepperCycle, in: 0...100000, step: 10)
                .foregroundColor(Color.black)
        }
        .font(.system(.largeTitle))
        .font(.system(size: 30))
        .padding()
        .shadow(radius: 20)
        .background(Color.yellow)
        .cornerRadius(20)
    }
}

struct StepperView_Previews: PreviewProvider {
    static var previews: some View {
        StepperView(stepperMeter: .constant(0), stepperCount: .constant(0), stepperCycle: .constant(0))
    }
}

