//
//  CloseButtonActionSheet.swift
//  LearningSwiftUI
//
//  Created by Alvian Gozali on 16/11/20.
//  Copyright © 2020 Alvian Gozali. All rights reserved.
//

import SwiftUI

struct CloseButtonActionSheet: View {
    @Binding var rootIsActive: Bool
    @Binding var closeButtonIsPressed: Bool
    
    var body: some View {
        VStack {
            Text("Close Triage ?")
                .frame(width: 303, height: 32, alignment: .center)
                .font(Font.system(size: 24, weight: .bold))
                .padding(.bottom, 24)
                .padding(.top, 41)
            Text("Are you sure you want to close the triage process ?")
                .frame(width: 303, height: 38, alignment: .center)
                .font(Font.system(size: 14, weight: .regular))
                .foregroundColor(Color.init(hex: "#676767"))
                .multilineTextAlignment(.center)
                .padding(.bottom, 42)
            
            HStack {
                Button(action: {
                    self.rootIsActive = false
                }) {
                    Text("Yes")
                        .font(Font.system(size: 15, weight: .bold))
                        .foregroundColor(Color.init(hex: "#4B2766"))
                        .frame(width: CGFloat(172), height: CGFloat(57), alignment: .center)
                        .background(Color.init(hex: "#E0C8F1"))
                        .cornerRadius(CGFloat(28.5))
                        .padding(.bottom, 52)
                }
                Button(action: {
                    self.closeButtonIsPressed.toggle()
                }) {
                    Text("No")
                        .font(Font.system(size: 15, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: CGFloat(172), height: CGFloat(57), alignment: .center)
                        .background(Color.init(hex: "#4B2766"))
                        .cornerRadius(CGFloat(28.5))
                        .padding(.bottom, 52)
                }
            }
        }
        .padding(.trailing, 32)
        .padding(.leading, 32)
        .background(Color.white)
        .cornerRadius(25, corners: [.topLeft, .topRight])
        .edgesIgnoringSafeArea(.bottom)
    }
}

//struct CloseButtonActionSheet_Previews: PreviewProvider {
//    static var previews: some View {
//        CloseButtonActionSheet(rootIsActive: .constant(false), closeButtonIsPressed: .constant(false))
//    }
//}


//Custome Rounded Corner Class
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
