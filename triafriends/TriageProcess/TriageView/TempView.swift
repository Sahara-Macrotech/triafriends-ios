//
//  TempView.swift
//  LearningSwiftUI
//
//  Created by Alvian Gozali on 04/11/20.
//  Copyright © 2020 Alvian Gozali. All rights reserved.
//

import SwiftUI

struct TempView: View {
    @State var tempData: TempTriageResult = TempTriageResult()
    var body: some View {
        VStack {
            Text(tempData.getName())
            Text(tempData.getPhoneNumber())
            Text(tempData.getAirway())
            Text(tempData.getRespitoryDistress())
            Text(tempData.getSpeak())
            
            Button(action: {
                print(self.tempData.getSpeak())
            }){
                Text("Test")
            }
        }
    }
}

struct TempView_Previews: PreviewProvider {
    static var previews: some View {
        TempView()
    }
}
