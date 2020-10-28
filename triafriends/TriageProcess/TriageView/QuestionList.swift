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
    
    var body: some View {
        //NavigationView {
            VStack {
                Text(arrOfQuestion.questions[self.currQuestion].question)
                    .frame(width: 350, height: 40, alignment: .topLeading)
                    .font(Font.system(size: 30))
                    .offset(x: -15, y: 0)
                    .padding()
                
                ForEach(0 ..< arrOfQuestion.questions[self.currQuestion].optionList.count) {
                    self.arrOfQuestion.questions[self.currQuestion].optionList[$0]
                    .padding(5)
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

struct QuestionList_Previews: PreviewProvider {
    static var previews: some View {
        QuestionList()
    }
}
