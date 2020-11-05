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
    var triageProcess: TempTriageResult = TempTriageResult()
    
    func setTriageProcess() {
        self.triageProcess.setName(name: self.name)
        print(self.triageProcess.getName())
    }
    
    var body: some View {
        NavigationView {
            VStack {
                CloseButton()
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
                
                NavigationLink(destination: PatientNumberInput(number: "", triageProcess: triageProcess).onAppear(perform: setTriageProcess)){
                    Text("Next")
                        .font(Font.system(size: 15, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: CGFloat(336), height: CGFloat(57), alignment: .center)
                        .background(Color.init(hex: "#4B2766"))
                        .cornerRadius(CGFloat(28.5))
                }
                
                
            }
            .frame(width: 350, height: 750, alignment: .topLeading)
            .navigationBarHidden(true)
            .navigationBarTitle("")
            
        }
        .navigationBarHidden(true)
        .navigationBarTitle("")
    }
}

struct PatientNameInput_Previews: PreviewProvider {
    static var previews: some View {
        PatientNameInput()
    }
}
