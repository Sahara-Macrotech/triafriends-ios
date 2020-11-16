//
//  DisableNextActionSheet.swift
//  LearningSwiftUI
//
//  Created by Alvian Gozali on 16/11/20.
//  Copyright © 2020 Alvian Gozali. All rights reserved.
//

import SwiftUI

struct DisableNextActionSheet: View {
    @Binding var nextButtonIsPressed: Bool
    
    var body: some View {
        VStack {
            Text("Can't Continue")
                .frame(width: 303, height: 32, alignment: .center)
                .font(Font.system(size: 24, weight: .bold))
                .padding(.bottom, 24)
                .padding(.top, 41)
            Text("You must fill the data first to continue to the next question")
                .frame(width: 303, height: 38, alignment: .center)
                .font(Font.system(size: 14, weight: .regular))
                .foregroundColor(Color.init(hex: "#676767"))
                .multilineTextAlignment(.center)
                .padding(.bottom, 42)
            
            HStack {
                Button(action: {
                    self.nextButtonIsPressed.toggle()
                }) {
                    Text("OK")
                        .font(Font.system(size: 15, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: CGFloat(336), height: CGFloat(57), alignment: .center)
                        .background(Color.init(hex: "#4B2766"))
                        .cornerRadius(CGFloat(28.5))
                        .padding(.bottom, 52)
                }
            }
        }
        .padding(.trailing, 40)
        .padding(.leading, 38)
        .background(Color.white)
        .cornerRadius(25, corners: [.topLeft, .topRight])
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct DisableNextActionSheet_Previews: PreviewProvider {
    static var previews: some View {
        DisableNextActionSheet(nextButtonIsPressed: .constant(false))
    }
}
