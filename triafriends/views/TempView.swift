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
    var helper = Algo()
    var db = RealtimeDBController()
    @ObservedObject var model = TriageListViewModel()
    @State var color: Color?
    //dummyhospitalID
    let hospitalID = "SILOAM2122"
    
    var body: some View {
        VStack {
            Text(tempData.getName())
            Text(tempData.getPhoneNumber())
            Text(tempData.getAirway())
            Text(tempData.getRespitoryDistress())
            Text(tempData.getSpeak())
            
            color
          
            
            Button(action: {
               
            }){
                Text("upload result")
            }
            
            Button(action: {
                print(self.tempData.getSpeak())
            }){
                Text("Test")
                
            }
        }.onAppear {
            
            var converted = model.stringToTriage(receivedTriage: tempData)
            print(converted)
            var calculated = helper.calc(triage: converted)
           print(calculated)
            
            //------------CODE JOROK UNTUK DEMO
            if calculated == .category5 {
                color = colorGreen
            } else if calculated == .category4 || calculated == .category3 {
                color = colorYellow
            } else if calculated == .category1 || calculated == .category2 {
                color = colorRed
            }
            
            //-------------------
            
            //staatus didalam converted triage belum di ubah berdasarkan calculation
            db.writeToDB(triages: converted, hospitalID: hospitalID)
            
            
            
            
        }
    }
}

struct TempView_Previews: PreviewProvider {
    static var previews: some View {
        TempView()
    }
}
