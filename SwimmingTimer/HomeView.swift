//
//  Home.swift
//  SwimmingTimer
//
//  Created by KimJongHee on 2022/01/17.
//

import SwiftUI

struct HomeView: View {
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var stepperMeter: CGFloat = 0
    @State private var stepperCount: CGFloat = 0
    @State private var stepperCycle: CGFloat = 0
    
    @State private var circleMeter: CGFloat = 0
    @State private var circleCount: CGFloat = 0
    @State private var circleCycle: CGFloat = 0
    
    @State private var isStart: Bool = false
    @State private var isSheet: Bool = false
    
    @State private var isRestSheet: Bool = false
    
    @State private var isPopUp: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    
                    Button(action: {
                        self.isReset()
                    }, label: {
                        Text("초기화")
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(20)
                    })
                    Spacer()
                    Button(action: {
                        //
                        if stepperMeter != 0 && stepperCount != 0 && stepperCycle != 0 {
                            if !isStart {
                                isRestSheet = true
                            }
                            isStart.toggle()
                        }
                    }, label: {
                        isStart ? Text("정지")
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(20): Text("시작")
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(20)
                    })
                    
                }
                .font(.system(size: 30))
                .padding()
                .background(Color.green)
                .cornerRadius(20)
                .padding(.horizontal, 20)
                StepperView(stepperMeter: $stepperMeter, stepperCount: $stepperCount, stepperCycle: $stepperCycle)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 20)
                CircleView(circleMeter: $circleMeter, circleCount: $circleCount, circleCycle: $circleCycle, stepperMeter: $stepperMeter, stepperCount: $stepperCount, stepperCycle: $stepperCycle)

            } // VStack
            .sheet(isPresented: $isRestSheet, content: {
                RestSheetView(isRestSheet: $isRestSheet, stepperCycle: $stepperCycle)
            })
            .sheet(isPresented: $isSheet, content: {
                SheetView(isSheet: $isSheet, circleMeter: $circleMeter, circleCount: $circleCount, circleCycle: $circleCycle, stepperMeter: $stepperMeter, stepperCount: $stepperCount, stepperCycle: $stepperCycle)
            })
            .onReceive(timer) { time in
                if !isRestSheet && isStart && stepperCycle != 0 && stepperCount != 0 && stepperMeter != 0 {
                    withAnimation {
                        circleCycle += 1
                        print("\(circleCycle) 초")
                    }
                    if circleCycle == stepperCycle - 5 {
                        if stepperCount - 1 != circleCount {
                            isSheet = true
                            print("5초 카운트 시작 \(isSheet)")
                        }
                    }
                    if circleCycle == stepperCycle {
                        withAnimation {
                            circleCount += 1
                            print("\(circleCount) 개")
                        }
                        circleCycle = 0
                        if circleCount == stepperCount {
                            isReset()
                            print("리셋")
                            isPopUp = true
                            print("팝업 \(isPopUp)")
                        }
                    }
                }
            } // VStack, onReceive
            PopUp(isPopUp: $isPopUp)
        } // ZStack
        
    }
    func isReset() {
        self.stepperMeter = 0
        self.stepperCount = 0
        self.stepperCycle = 0
        self.circleMeter = 0
        self.circleCount = 0
        self.circleCycle = 0
        self.isStart = false
        self.isSheet = false
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
