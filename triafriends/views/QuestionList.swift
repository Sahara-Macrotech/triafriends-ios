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
    @State var nextButtonIsPressed = false
    @State var isPressed = false
    @State var selectedIndex = 0
    @State var selectedOption = ""
    @State var triageProcess = TempTriageResult()
    @State var closeButtonIsPressed: Bool = false
    @Binding var rootIsActive: Bool
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            // PERTANYAAN TRIASE DAN SELECTION
            VStack {
                CloseButton(rootIsActive: self.$rootIsActive, closeButtonIsPressed: self.$closeButtonIsPressed)
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
                
                // BUTTONS
                HStack {
                    
                    if self.currQuestion == 0 {
                        Button(action: {
                            //self.nextPressed.toggle()
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
                            //self.nextPressed.toggle()
                            if self.currQuestion > 0 {
                                self.currQuestion -= 1
                                //print(self.selectedOption)
                            }
                            self.setPreviousSelectedOption()
                        
                        }) {
                            Text("Previous")
                                .font(Font.system(size: 15, weight: .bold))
                                .foregroundColor(Color.init(hex: "#4B2766"))
                                .frame(width: CGFloat(172), height: CGFloat(57), alignment: .center)
                                .background(Color.init(hex: "#E0C8F1"))
                                .cornerRadius(CGFloat(28.5))
                        }
                    }
                    
                    if self.currQuestion == (self.arrOfQuestion.questions.count-1) || self.selectedOption == "No Live Sign & No Pulse"{
                        NavigationLink(destination: TempView(tempData: triageProcess, rootIsActive: self.$rootIsActive).onAppear(perform: setTriageProcessList)){
                            Text("See Result")
                                .font(Font.system(size: 15, weight: .bold))
                                .foregroundColor(.white)
                                .frame(width: CGFloat(172), height: CGFloat(57), alignment: .center)
                                .background(Color.init(hex: "#4B2766"))
                                .cornerRadius(CGFloat(28.5))
                        }
                        .isDetailLink(false)
                    }
                    
                    else {
                        Button(action: {
                            if selectedOption == "" {
                                self.nextButtonIsPressed.toggle()
                            }
                            else {
                                if self.currQuestion < (self.arrOfQuestion.questions.count-1) {
                                    self.setTriageProcessList()
                                    self.currQuestion += 1
                                    self.setPreviousSelectedOption()
                                }
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
            
            //CLOSE BUTTON ACTION SHEET
            VStack {
                Spacer()
                CloseButtonActionSheet(rootIsActive: self.$rootIsActive, closeButtonIsPressed: self.$closeButtonIsPressed).offset(y: self.closeButtonIsPressed ? 0 : UIScreen.main.bounds.height)
            }
            .background((self.closeButtonIsPressed ? Color.black.opacity(0.3) : Color.clear).onTapGesture {
                self.closeButtonIsPressed.toggle()
            })
            .edgesIgnoringSafeArea(.bottom)
            .animation(.default)
            
            //DISABLE NEXT BUTTON ACTION SHEET
            VStack {
                Spacer()
                DisableNextActionSheet(nextButtonIsPressed: self.$nextButtonIsPressed).offset(y: self.nextButtonIsPressed ? 0 : UIScreen.main.bounds.height)
            }
            .background((self.nextButtonIsPressed ? Color.black.opacity(0.3) : Color.clear).onTapGesture {
                self.nextButtonIsPressed.toggle()
            })
            .edgesIgnoringSafeArea(.bottom)
            .animation(.default)
        }
        
    }
    
    func getCount(index: Int) -> Int {
        return arrOfQuestion.questions[index].options.count
    }
    
    func checkEmptyString() {
        if selectedOption == "" {
            self.isPressed = false
        }
        else {
            self.isPressed = true
        }
    }
    
    func setTriageProcessList() {
        
        if self.currQuestion == 0 {
            triageProcess.setIsAlive(isAlive: selectedOption)
        }
        if self.currQuestion == 1 {
            triageProcess.setAirway(airway: selectedOption)
        }
        if self.currQuestion == 2 {
            triageProcess.setRespitoryDistress(respitoryDistress: selectedOption)
        }
        if self.currQuestion == 3 {
            triageProcess.setSpeak(speak: selectedOption)
        }
        if self.currQuestion == 4 {
            triageProcess.setBreath(breath: selectedOption)
        }
        if self.currQuestion == 5 {
            triageProcess.setHipoventilasi(hipoventilasi: selectedOption)
        }
        if self.currQuestion == 6 {
            triageProcess.setEmodynamicDisturbance(emodynamicDistrubance: selectedOption)
        }
        if self.currQuestion == 7 {
            triageProcess.setPulse(pulse: selectedOption)
        }
        if self.currQuestion == 8 {
            triageProcess.setBleeding(bleeding: selectedOption)
        }
        if self.currQuestion == 9 {
            triageProcess.setSkinCondition(skinCondition: selectedOption)
        }
        if self.currQuestion == 10 {
            triageProcess.setGCS(GCS: selectedOption)
        }
        if self.currQuestion == 11 {
            triageProcess.setMentalSTate(mentalState: selectedOption)
            triageProcess.setFinishTime()
        }
    }
    
    func setPreviousSelectedOption() {
        
        if self.currQuestion == 0 {
            selectedOption = triageProcess.getIsAlive()
        }
        if self.currQuestion == 1 {
            selectedOption = triageProcess.getAirway()
            checkEmptyString()
        }
        if self.currQuestion == 2 {
            selectedOption = triageProcess.getRespitoryDistress()
            checkEmptyString()
        }
        if self.currQuestion == 3 {
            selectedOption = triageProcess.getSpeak()
            checkEmptyString()
        }
        if self.currQuestion == 4 {
            selectedOption = triageProcess.getBreath()
            checkEmptyString()
        }
        if self.currQuestion == 5 {
            selectedOption = triageProcess.getHipoventilasi()
            checkEmptyString()
        }
        if self.currQuestion == 6 {
            selectedOption = triageProcess.getEmodynamicDisturbance()
            checkEmptyString()
        }
        if self.currQuestion == 7 {
            selectedOption = triageProcess.getPulse()
            checkEmptyString()
        }
        if self.currQuestion == 8 {
            selectedOption = triageProcess.getBleeding()
            checkEmptyString()
        }
        if self.currQuestion == 9 {
            selectedOption = triageProcess.getSkinCondition()
            checkEmptyString()
        }
        if self.currQuestion == 10 {
            selectedOption = triageProcess.getGCS()
            checkEmptyString()
        }
        if self.currQuestion == 11 {
            selectedOption = triageProcess.getMentalState()
            checkEmptyString()
        }
        
        for (index,option) in arrOfQuestion.questions[currQuestion].options.enumerated(){
            if option == selectedOption {
                selectedIndex = index
            }
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
