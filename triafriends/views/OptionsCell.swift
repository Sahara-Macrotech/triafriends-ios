//
//  OptionsCell.swift
//  LearningSwiftUI
//
//  Created by Alvian Gozali on 27/10/20.
//  Copyright © 2020 Alvian Gozali. All rights reserved.
//

import SwiftUI

struct OptionsCell: View {
    
    @Binding var option: String
    var fontSize = 20
    var frameWidth = 350
    var frameHeight = 56
    var alignment = Alignment.topLeading
    var cornerRadius = 10
    
    var lightPurple = Color.init(hex: "#E0C8F1")
    var deepPurple = Color.init(hex: "#4B2766")
    var lightGray = Color.init(hex: "#F7F7F7")
    
    @State var cellPressed = false
    @State var index: Int
    @Binding var selectedIndex: Int
    @Binding var selectedOption: String
    
    var group = DispatchGroup()
    
    var body: some View {
        Button(action: {
            //self.cellPressed.toggle()
            self.selectedIndex = self.index
            self.selectedOption = self.option
        }) {
            HStack {
                Text(option)
                    .font(Font.system(size: CGFloat(fontSize), weight: .medium))
                    .offset(x:10, y:12)
                    .foregroundColor((self.selectedIndex == self.index) ? deepPurple : Color.black)
                    .frame(width: CGFloat(300), height: CGFloat(56), alignment: .topLeading)
                if self.selectedIndex == self.index {
                    Image(systemName: "checkmark.circle")
                    .font(.system(size: 30))
                    .foregroundColor(deepPurple)
                }
                    
            }
            .frame(width: CGFloat(350), height: CGFloat(56), alignment: alignment)
            .overlay(RoundedRectangle(cornerRadius: CGFloat(cornerRadius)).stroke((self.selectedIndex == self.index) ? deepPurple : lightGray, lineWidth: 4))
            .background((self.selectedIndex == self.index) ? lightPurple : lightGray)
            .cornerRadius(CGFloat(cornerRadius))
        }
    }
}

//struct OptionsCell_Previews: PreviewProvider {
//    static var previews: some View {
//        OptionsCell()
//    }
//}
