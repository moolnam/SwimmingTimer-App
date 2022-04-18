//
//  CircleView.swift
//  SwimmingTimer
//
//  Created by KimJongHee on 2022/01/17.
//

import SwiftUI


struct CircleView: View {
    
    @Binding var circleMeter: CGFloat
    @Binding var circleCount: CGFloat
    @Binding var circleCycle: CGFloat
    
    @Binding var stepperMeter: CGFloat
    @Binding var stepperCount: CGFloat
    @Binding var stepperCycle: CGFloat
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .frame(width: 210, height: 210)
                    .foregroundColor(Color.green)
                Circle()
                    .trim(from: 0, to: 1)
                    .stroke(Color.blue.opacity(0.5), style: StrokeStyle(lineWidth: 30, lineCap: .round))
                    .frame(width: 300, height: 300, alignment: .center)
//                    .shadow(color: .blue, radius: 5, x: 5, y: 5)
                    .rotationEffect(.init(degrees: -90))
                Circle()
                    .trim(from: 0, to: circleCycle / stepperCycle)
                    .stroke(Color.blue.opacity(1), style: StrokeStyle(lineWidth: 30, lineCap: .round))
                    .frame(width: 300, height: 300, alignment: .center)
//                    .shadow(color: .blue, radius: 5, x: 5, y: 5)
                    .rotationEffect(.init(degrees: -90))
                Circle()
                    .trim(from: 0, to: 1)
                    .stroke(Color.red.opacity(0.5), style: StrokeStyle(lineWidth: 25, lineCap: .round))
                    .frame(width: 240, height: 240, alignment: .center)
//                    .shadow(color: .red, radius: 5, x: 5, y: 5)
                    .rotationEffect(.init(degrees: -90))
                Circle()
                    .trim(from: 0, to: circleCount / stepperCount)
                    .stroke(Color.red.opacity(1), style: StrokeStyle(lineWidth: 25, lineCap: .round))
                    .frame(width: 240, height: 240, alignment: .center)
//                    .shadow(color: .red, radius: 5, x: 5, y: 5)
                    .rotationEffect(.init(degrees: -90))
                VStack {
                    Spacer()
                    Text("\(Int(stepperCount)) / \(Int(circleCount))")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    Text("\(Int(stepperCycle)) / \(Int(circleCycle))")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    Spacer()
                }
                .font(.system(size: 50))
                .padding()
            }
        }
        .padding()
//        .background(Color.yellow)
        .cornerRadius(20)
    }
}

struct CircleVIew_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(circleMeter: .constant(0), circleCount: .constant(0), circleCycle: .constant(0), stepperMeter: .constant(0), stepperCount: .constant(0), stepperCycle: .constant(0))
    }
}
