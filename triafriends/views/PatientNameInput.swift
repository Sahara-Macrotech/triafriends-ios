//
//  PatientDataInput.swift
//  LearningSwiftUI
//
//  Created by Alvian Gozali on 03/11/20.
//  Copyright © 2020 Alvian Gozali. All rights reserved.
//

import SwiftUI

struct PatientNameInput: View {
    @State var name: String = ""
    @State var closeButtonIsPressed: Bool = false
    @State var nextButtonIsPressed: Bool = false
    @Binding var rootIsActive: Bool
    var triageProcess: TempTriageResult = TempTriageResult()
    
    func setTriageProcess() {
        self.triageProcess.setName(name: self.name)
        print(self.triageProcess.getName())
    }
    
    func isNameEmpty() -> Bool{
        if self.name == "" {
            return true
        }
        return false
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    CloseButton(rootIsActive: self.$rootIsActive, closeButtonIsPressed: self.$closeButtonIsPressed)
                        .frame(width: 350, height:40, alignment: .topLeading)
                        .padding(.bottom, 25)
                    
                    Text("Input patient name")
                        .frame(width: 350, height: 32, alignment: .topLeading)
                        .font(Font.system(size: 24, weight: .bold))
                        .padding(.bottom, 40)
                    
                    TextField("Enter Patient Name", text: $name)
                        .multilineTextAlignment(.leading)
                        .font(Font.system(size:32, weight: .regular))
                        .foregroundColor(Color.init(hex: "#858585"))
                        .padding(.bottom, 30)

                    Rectangle()
                        .frame(width: 350, height:2)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    //NEXT BUTTON CHECK STRING NAME
                    if isNameEmpty() {
                        Button(action: {
                            self.nextButtonIsPressed.toggle()
                        }) {
                            Text("Next")
                                .font(Font.system(size: 15, weight: .bold))
                                .foregroundColor(.white)
                                .frame(width: CGFloat(336), height: CGFloat(57), alignment: .center)
                                .background(Color.init(hex: "#4B2766"))
                                .cornerRadius(CGFloat(28.5))
                        }
                    }
                    
                    else {
                        NavigationLink(destination: QuestionList(triageProcess: triageProcess, rootIsActive: self.$rootIsActive).onAppear(perform: setTriageProcess)){
                            Text("Next")
                                .font(Font.system(size: 15, weight: .bold))
                                .foregroundColor(.white)
                                .frame(width: CGFloat(336), height: CGFloat(57), alignment: .center)
                                .background(Color.init(hex: "#4B2766"))
                                .cornerRadius(CGFloat(28.5))
                        }
                        .isDetailLink(false)
                    }
                    
                }
                .frame(width: 350, height: 750, alignment: .topLeading)
                .navigationBarHidden(true)
                .navigationBarTitle("")
                
                //CLOSE BUTTON ACTION SHEET
                VStack {
                    Spacer()
                    CloseButtonActionSheet(rootIsActive: self.$rootIsActive, closeButtonIsPressed: self.$closeButtonIsPressed).offset(y: self.closeButtonIsPressed ? 0 : UIScreen.main.bounds.height)
                }
                .background((self.closeButtonIsPressed ? Color.black.opacity(0.3) : Color.clear).onTapGesture {
                    self.closeButtonIsPressed.toggle()
                })
                .edgesIgnoringSafeArea(.bottom)
                
                VStack {
                    Spacer()
                    DisableNextActionSheet(nextButtonIsPressed: self.$nextButtonIsPressed).offset(y: self.nextButtonIsPressed ? 0 : UIScreen.main.bounds.height)
                }
                .background((self.nextButtonIsPressed ? Color.black.opacity(0.3) : Color.clear).onTapGesture {
                    self.nextButtonIsPressed.toggle()
                })
                .edgesIgnoringSafeArea(.bottom)
            }.onAppear {
                self.triageProcess.setStartTime()
            }
            
        }
        .animation(.default)
        .navigationBarHidden(true)
        .navigationBarTitle("")
    }
}

//struct PatientNameInput_Previews: PreviewProvider {
//    static var previews: some View {
//        PatientNameInput(rootIsActive: true)
//    }
//}
