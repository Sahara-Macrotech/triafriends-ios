//
//  QuestionList.swift
//  LearningSwiftUI
//
//  Created by Alvian Gozali on 28/10/20.
//  Copyright © 2020 Alvian Gozali. All rights reserved.
//

import SwiftUI

struct QuestionList: View {
    var arrOfQuestion = TriageViewModel.init()
    @State var currQuestion = 0
    @State var nextPressed = false
    @State var isShown = true
    @State var selectedIndex = 0
    @State var triageValue = ""
    
    var body: some View {
        //NavigationView {
        VStack {
            Text(arrOfQuestion.questions[self.currQuestion].question)
                .frame(width: 350, height: 40, alignment: .topLeading)
                .font(Font.system(size: 30))
                .offset(x: -15, y: 0)
                .padding()
            
            ForEach(0 ..< arrOfQuestion.questions[self.currQuestion].optionList.count) {
                i in
                
                CardSelection(option: self.arrOfQuestion.questions[self.currQuestion].optionList[i], triageValue: $triageValue, index: i, selectedIndex: $selectedIndex)
            }
            Spacer()
            
            Button(action: {
                self.nextPressed.toggle()
                if self.currQuestion < (self.arrOfQuestion.questions.count-1) {
                    self.currQuestion += 1
                }
                if self.currQuestion == (self.arrOfQuestion.questions.count-1) {
                    self.isShown = false
                }
            }) {
                if isShown {
                    Text("Next")
                }
                else {
                    Text("Next").hidden()
                }
            }
            
            
        }.navigationBarTitle(arrOfQuestion.questions[self.currQuestion].question)
        //}
        
    }
}

struct CardSelection: View {
    @State var option = ""
    var fontSize = 20
    var frameWidth = 350
    var frameHeight = 30
    var alignment = Alignment.topLeading
    var borderColor = Color.black
    var backgroundColor = Color.gray
    var cornerRadius = 10
    
    @Binding var triageValue: String
    @State var index: Int
    @Binding var selectedIndex: Int
    
    var group = DispatchGroup()
    
    var body: some View {
        Button(action: {
            self.selectedIndex = index
            self.triageValue = option
            print(triageValue)
        }) {
            Text(option)
                .font(Font.system(size: CGFloat(fontSize)))
                .frame(width: CGFloat(frameWidth), height: CGFloat(frameHeight), alignment: alignment)
                .padding().overlay(RoundedRectangle(cornerRadius: CGFloat(cornerRadius)).stroke(borderColor, lineWidth: 4))
                .background((self.selectedIndex == self.index) ? Color.red : Color.gray)
                .cornerRadius(CGFloat(cornerRadius))
                .foregroundColor(Color.black)
        }
    }
}

struct QuestionList_Previews: PreviewProvider {
    static var previews: some View {
        QuestionList()
    }
}
