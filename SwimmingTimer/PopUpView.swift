//
//  RestView.swift
//  SwimmingTimer
//
//  Created by KimJongHee on 2022/01/17.
//

import SwiftUI

struct PopUp: View {
    
    @Binding var isPopUp: Bool
    
    var body: some View {
        if isPopUp {
            ZStack {
                Rectangle()
                    .cornerRadius(20)
                    .frame(width: 300, height: 300, alignment: .center)
                    .foregroundColor(Color.blue.opacity(1))
                    .shadow(color: Color.black, radius: 10, x: 10, y: 10)
                VStack {
                    Text("훈련 완료!")
                        .font(.system(size: 40))
                        .font(.headline)
                        .foregroundColor(Color.white.opacity(1))
                    Text("잘했어요!")
                        .font(.system(size: 40))
                        .font(.headline)
                        .foregroundColor(Color.white.opacity(1))
                    Button(action: {
                        isPopUp = false
                    }, label: {
                        Image(systemName: "clear.fill")
                            .frame(width: 200, height: 100)
                            .cornerRadius(20)
                            .foregroundColor(Color.white.opacity(1))
                            .font(.system(size: 100))
                    })
                }
            }
        }
    }
}

struct PopUp_Previews: PreviewProvider {
    static var previews: some View {
        PopUp(isPopUp: .constant(false))
    }
}
