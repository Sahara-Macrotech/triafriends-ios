//
//  QuestionList.swift
//  LearningSwiftUI
//
//  Created by Alvian Gozali on 28/10/20.
//  Copyright © 2020 Alvian Gozali. All rights reserved.
//

import SwiftUI

struct QuestionList: View {
    @State var arrOfQuestion = TriageViewModel.init()
    @State var currQuestion = 0
    @State var nextPressed = false
    @State var isPressed = false
    @State var selectedIndex = 0
    @State var selectedOption = ""
    @State var triageProcess = TempTriageResult()
    @Binding var rootIsActive: Bool
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            CloseButton(rootIsActive: self.$rootIsActive)
                .frame(width: 350, height:40, alignment: .topLeading)
                .padding(.bottom, 25)
            
            Text(arrOfQuestion.questions[self.currQuestion].question)
                .frame(width: 350, height: 60, alignment: .topLeading)
                .font(Font.system(size: 24, weight: .bold))
                .padding(.bottom, 30)
                
            ForEach(arrOfQuestion.questions[self.currQuestion].options.indices, id: \.self) { i in
                OptionsCell(option: self.$arrOfQuestion.questions[self.currQuestion].options[i], cellPressed: self.$isPressed, index: i, selectedIndex: self.$selectedIndex, selectedOption: self.$selectedOption).padding(.bottom, 10)
            }
                
            Spacer()
                
            HStack {
                
                if self.currQuestion == 0 {
                    Button(action: {
                        self.nextPressed.toggle()
                        presentationMode.wrappedValue.dismiss()
                    
                    }) {
                        Text("Previous")
                        .font(Font.system(size: 15, weight: .bold))
                        .foregroundColor(Color.init(hex: "#4B2766"))
                        .frame(width: CGFloat(172), height: CGFloat(57), alignment: .center)
                        .background(Color.init(hex: "#E0C8F1"))
                        .cornerRadius(CGFloat(28.5))
                    }
                }
                else {
                    Button(action: {
                    self.nextPressed.toggle()
                    if self.currQuestion > 0 {
                        self.currQuestion -= 1
                        //print(self.selectedOption)
                    }
                    
                    }) {
                        Text("Previous")
                        .font(Font.system(size: 15, weight: .bold))
                        .foregroundColor(Color.init(hex: "#4B2766"))
                        .frame(width: CGFloat(172), height: CGFloat(57), alignment: .center)
                        .background(Color.init(hex: "#E0C8F1"))
                        .cornerRadius(CGFloat(28.5))
                    }
                }
                
                if self.currQuestion == (self.arrOfQuestion.questions.count-1) {
                    NavigationLink(destination: TempView(tempData: triageProcess, rootIsActive: self.$rootIsActive).onAppear(perform: setTriageProcessList)){
                        Text("See Result")
                            .font(Font.system(size: 15, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: CGFloat(172), height: CGFloat(57), alignment: .center)
                            .background(Color.init(hex: "#4B2766"))
                            .cornerRadius(CGFloat(28.5))
                    }
                }
                
                else {
                    Button(action: {
                    self.nextPressed.toggle()
                    if self.currQuestion < (self.arrOfQuestion.questions.count-1) {
                        self.setTriageProcessList()
                        self.currQuestion += 1
                    }
                    }) {
                        Text("Next")
                        .font(Font.system(size: 15, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: CGFloat(172), height: CGFloat(57), alignment: .center)
                        .background(Color.init(hex: "#4B2766"))
                        .cornerRadius(CGFloat(28.5))
                    }
                }
            }
                
            .navigationBarHidden(true)
            .navigationBarTitle("")
        }
        .frame(width: 350, height: 750, alignment: .topLeading)
        .navigationBarTitle(arrOfQuestion.questions[self.currQuestion].question)
        
    }
    
    func getCount(index: Int) -> Int {
        return arrOfQuestion.questions[index].options.count
    }
    
    func setTriageProcessList() {
        self.isPressed = false
        if self.currQuestion == 0 {
            triageProcess.setAirway(airway: selectedOption)
        }
        if self.currQuestion == 1 {
            triageProcess.setRespitoryDistress(respitoryDistress: selectedOption)
        }
        if self.currQuestion == 2 {
            triageProcess.setSpeak(speak: selectedOption)
        }
        if self.currQuestion == 3 {
            triageProcess.setBreath(breath: selectedOption)
        }
        if self.currQuestion == 4 {
            triageProcess.setHipoventilasi(hipoventilasi: selectedOption)
        }
        if self.currQuestion == 5 {
            triageProcess.setEmodynamicDisturbance(emodynamicDistrubance: selectedOption)
        }
        if self.currQuestion == 6 {
            triageProcess.setPulse(pulse: selectedOption)
        }
        if self.currQuestion == 7 {
            triageProcess.setBleeding(bleeding: selectedOption)
        }
        if self.currQuestion == 8 {
            triageProcess.setSkinCondition(skinCondition: selectedOption)
        }
        if self.currQuestion == 9 {
            triageProcess.setGCS(GCS: selectedOption)
        }
        if self.currQuestion == 10 {
            triageProcess.setMentalSTate(mentalState: selectedOption)
        }
    }
}
//
//struct QuestionList_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            QuestionList()
//            QuestionList()
//            QuestionList()
//        }
//    }
//}
