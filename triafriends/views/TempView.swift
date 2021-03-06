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
    @State var calculated: Algo.ColorScale?
    @State var converted: Triage?
    @State var patientID: String?
    @Binding var rootIsActive: Bool
    //dummyhospitalID
    let hospitalID = "SILOAM2122"
    
    var body: some View {
        ZStack{
            
            color
                .ignoresSafeArea()
            VStack {
                Spacer()
                
                
                Text(getText(result: calculated ?? Algo.ColorScale.category5).alert)
                    .font(.custom(nameBlack, size: 24))
                    .foregroundColor(.white)
                    .padding()
                Text(getText(result: calculated ?? Algo.ColorScale.category5).desc)
                    .font(.custom(nameSemiBold, size: 20))
                    .foregroundColor(.white)
                    .padding()
                
                
                Spacer()
                HStack {
                    Button (
                        action: {
                            self.rootIsActive = false
                        },
                        label: {
                            ZStack{
                                Rectangle()
                                    .frame(width: screen.width * 0.45, height: 57, alignment: .center)
                                    .cornerRadius(100)
                                    .foregroundColor(.white)
                                Text("Back to Home")
                                    .font(.custom(nameBold, size: 15))
                                    .accentColor(.black)
                            }
                        }).padding(.leading, 20)
                    NavigationLink(
                        destination: PatientDetailView(triages: converted, patientID: patientID, rootIsActive: self.$rootIsActive, afterInputDataPatient: true),
                        label: {
                            ZStack{
                                Rectangle()
                                    .frame(width: screen.width * 0.45, height: 57, alignment: .center)
                                    .foregroundColor(Color.white)
                                    .buttonStyle(PlainButtonStyle())
                                    .cornerRadius(100)
                                Rectangle()
                                    .frame(width: screen.width * 0.44, height: 55, alignment: .center)
                                    .foregroundColor(color)
                                    .buttonStyle(PlainButtonStyle())
                                    .cornerRadius(100)
                                Text("See detail")
                                    .font(.custom(nameBold, size: 15))
                                    .accentColor(.white)
                            }
                        }).padding(.trailing, 20)
                }
                
                
            }.onAppear {
                
                converted = model.stringToTriage(receivedTriage: tempData)
                //    print(converted)
                print(tempData)
                calculated = helper.calc(triage: converted!, alive: tempData.getIsAlive())
                //  print(calculated)
                
                converted?.status = calculated?.rawValue
                
                //------------CODE JOROK UNTUK DEMO
                if calculated == .category5 {
                    color = colorGreen
                } else if calculated == .category4 || calculated == .category3 {
                    color = colorYellow
                } else if calculated == .category1 || calculated == .category2 {
                    color = colorRed
                } else { color = .black }
                
                //-------------------
                
                //staatus didalam converted triage belum di ubah berdasarkan calculation
                db.writeToDB(triages: converted!, hospitalID: hospitalID, completion: {id in patientID = id})
                
                
                
                
            }
        }
    }
    func getText(result: Algo.ColorScale) -> (alert: String, desc: String){
        var alert: String = ""
        var desc: String = ""
        switch result {
        case .category1:
            alert = "RESUSCITATION"
            desc = "Maximum response time : Immediately"
        case .category2:
            alert = "EMERGENCY"
            desc = "Maximum resopnse time : 10 Minutes"
        case .category3:
            alert = "URGENT"
            desc = "Maximum response time : 30 Minutes"
        case .category4:
            alert = "SEMI URGENT"
            desc = "Maximum response time : 60 Minutes"
            
        case .category6:
            alert = "DEAD"
            desc = " "
        default:
            alert = "Maximum response time : 120 Minutes"
        }
        return (alert, desc)
    }
}

//struct TempView_Previews: PreviewProvider {
//    static var previews: some View {
//        TempView()
//    }
//}
