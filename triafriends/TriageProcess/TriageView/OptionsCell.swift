//
//  OptionsCell.swift
//  LearningSwiftUI
//
//  Created by Alvian Gozali on 27/10/20.
//  Copyright © 2020 Alvian Gozali. All rights reserved.
//

import SwiftUI

struct OptionsCell: View {
    
    var option = ""
    var fontSize = 20
    var frameWidth = 350
    var frameHeight = 30
    var alignment = Alignment.topLeading
    var borderColor = Color.black
    var backgroundColor = Color.gray
    var cornerRadius = 10
    
    @State var cellPressed = false
    
    var body: some View {
        Button(action: {
            self.cellPressed.toggle()
        }) {
            Text(option)
            .font(Font.system(size: CGFloat(fontSize)))
            .frame(width: CGFloat(frameWidth), height: CGFloat(frameHeight), alignment: alignment)
            .padding().overlay(RoundedRectangle(cornerRadius: CGFloat(cornerRadius)).stroke(borderColor, lineWidth: 4))
                .background(cellPressed ? Color.red : Color.gray)
            .cornerRadius(CGFloat(cornerRadius))
            .foregroundColor(Color.black)
        }
    }
    
    mutating func setOption(option: String) {
        self.option = option
    }
    
    mutating func setFontSize(fontSize: Int) {
        self.fontSize = 20
    }
    
    mutating func setFrameWidth(frameWidth: Int) {
        self.frameWidth = frameWidth
    }
    
    mutating func setFrameheight(frameHeight: Int) {
        self.frameHeight = frameHeight
    }
    
    mutating func setAlignment(alignment: Alignment) {
        self.alignment = alignment
    }
    
    mutating func setBorderColor(borderColor: Color) {
        self.borderColor = borderColor
    }
    
    mutating func setBackgroundColor(backgroundColor: Color) {
        self.backgroundColor = backgroundColor
    }
    
    mutating func setCornerRadius(cornerRadius: Int) {
        self.cornerRadius = cornerRadius
    }
}

struct OptionsCell_Previews: PreviewProvider {
    static var previews: some View {
        OptionsCell()
    }
}
