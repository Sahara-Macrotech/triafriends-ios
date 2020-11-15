//
//  PatientNumberInput.swift
//  LearningSwiftUI
//
//  Created by Alvian Gozali on 03/11/20.
//  Copyright © 2020 Alvian Gozali. All rights reserved.
//

import SwiftUI

struct PatientNumberInput: View {
    @State var number: String = ""
    @Binding var rootIsActive: Bool
    var triageProcess: TempTriageResult = TempTriageResult()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    func setTriageProcess() {
        triageProcess.setPhoneNumber(phoneNumber: number)
    }
    
    var body: some View {
        VStack {
            CloseButton()
                .frame(width: 350, height:40, alignment: .topLeading)
                .padding(.bottom, 25)
            
            Text("Phone Number")
                .frame(width: 350, height: 32, alignment: .topLeading)
                .font(Font.system(size: 24, weight: .bold))
                .padding(.bottom, 40)
            
            TextField("Enter Patient Number", text: $number)
                .multilineTextAlignment(.leading)
                .font(Font.system(size:32, weight: .regular))
                .foregroundColor(Color.init(hex: "#858585"))
                .padding(.bottom, 30)
                .keyboardType(.numberPad)

            Rectangle()
                .frame(width: 350, height:2)
                .foregroundColor(.black)
            
            Spacer()
            
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }){
                    Text("Previous")
                        .font(Font.system(size: 15, weight: .bold))
                        .foregroundColor(Color.init(hex: "#4B2766"))
                        .frame(width: CGFloat(172), height: CGFloat(57), alignment: .center)
                        .background(Color.init(hex: "#E0C8F1"))
                        .cornerRadius(CGFloat(28.5))
                }
                
                NavigationLink(destination: QuestionList(triageProcess: triageProcess, rootIsActive: self.$rootIsActive).onAppear(perform: setTriageProcess)){
                    Text("Next")
                        .font(Font.system(size: 15, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: CGFloat(172), height: CGFloat(57), alignment: .center)
                        .background(Color.init(hex: "#4B2766"))
                        .cornerRadius(CGFloat(28.5))
                }
                
            }
            
        }.frame(width: 350, height: 750, alignment: .topLeading)
        .navigationBarHidden(true)
        .navigationBarTitle("")
    }
}
//
//struct PatientNumberInput_Previews: PreviewProvider {
//    static var previews: some View {
//        PatientNumberInput(rootIsActive: Binding<true>)
//    }
//}
