//
//  PatientDetailView.swift
//  triafriends
//
//  Created by Abigail Aryaputra Sudarman on 24/10/20.
//

import SwiftUI
import FirebaseDatabase
struct PatientDetailView: View {
    var triages: Triage?
    var patientID: String?
    @Binding var rootIsActive: Bool
    
    var afterInputDataPatient: Bool?
    @State var stateChanged: Bool = false
    //var triageData: TriageData?
    
    var helper = RealtimeDBController()
   
   // var color: Color?

  
    var body: some View {
        
        VStack{
            ZStack{
                colorLightGray
                    .cornerRadius(radius)
                ZStack{
                    
                    
                    HStack{
                        VStack{
                            
                            HStack{
                                Text(triages!.name!)
                                    .multilineTextAlignment(.leading)
                                    .font(Font.custom(nameBold, size: 20 ))
                                
                                Spacer()
                            }
                            
                            HStack{
                                ZStack{
                                    
                                    colorLightPurple
                                        .frame(width: 50, height: 25, alignment: .leading)
                                        .cornerRadius(radius)
                                    
                                    Text(initialNameWithoutStars(name: (triages?.name)!))
                                        .font(Font.custom(nameExtraBold, size: 12))
                                        .foregroundColor(colorPurple)
                                    
                                    
                                }
                                Spacer()
                            }
                            
                            HStack{
                                Text("Start:")
                                    .font(Font.custom(nameBold, size: 12))
                                ZStack{
                                    colorTeal
                                        .cornerRadius(10)
                                        .frame(width: 46, height: 16, alignment: .center)
                                    Text("\(triages!.startTime)")
                                        .font(Font.custom(nameBold, size: 10))
                                        .foregroundColor(.white)
                                    
                                }
                                Text("End:")
                                    .font(Font.custom(nameBold, size: 12))
                                ZStack{
                                    colorLightGreen
                                        .cornerRadius(10)
                                        .frame(width: 46, height: 16, alignment: .center)
                                    Text("\(triages!.endTime)")
                                        .foregroundColor(.white)
                                        .font(Font.custom(nameBold, size: 10))
                                    
                                    
                                }
                                Spacer()
                            }
                            
                            
                        }
                        //.frame(width: 200, height: 100, alignment: .leading)
                        
                        
                        Spacer()
                        getColor(triage: triages!)
                            .frame(width: 40, height: 40, alignment: .center)
                            .cornerRadius(radius)
                        
                        
                    }
                    
                }
                .frame(width: 330, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .scaleEffect(CGSize(width: 1.0, height: 1.0))
                
            }
            .frame(width: 360, height: 100, alignment: .center)
            .position(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.maxY / 20)
            
            
            ViewOne(triages: triages!)
            
            
            ViewTwo(triages: triages!, patientID: patientID, rootIsActive: self.$rootIsActive)
            Spacer(minLength: 50)
        }
        .navigationBarBackButtonHidden(afterInputDataPatient ?? false)
        
    }
    func getColor(triage: Triage) -> Color{
        var color: Color
        
        if triage.status == 5 {
            color = colorGreen
        } else if triage.status == 3 || triage.status == 4 {
            color = colorYellow
        } else if triage.status == 1 || triage.status == 2 {
            color = colorRed
        } else {
            color = .black
        }
        return color
    }
    
     
    
}
//
//
//struct PatientDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        PatientDetailView()
//            .previewDevice("iPhone 11 Pro")
//    }
//}

struct ViewOne: View {
    var convertHelper = convert()
    var triages: Triage
    var body: some View {
        
        VStack{
            
            HStack{
                Text("Triage Check Result")
                    .font(Font.custom(nameBold, size: 24))
                Spacer()
                
            }.padding()
            //TO DO :  Bikin loop horizontal dan ambil data dari model
            // DATA DIBAWAH ADALAH DUMMY
            
            VStack{
                HStack{
                    Text("Airway : ")
                        .font(Font.custom(nameSemiBold, size: 16))
                        .foregroundColor(.black)
                    
                    Spacer()
                    Text(triages.jalanNafas?.rawValue ?? " ")
                        .font(Font.custom(nameBold, size: 16))
                        .foregroundColor(convertHelper.airToColor(input: triages.jalanNafas!))
                    
                }
                
                
                
                HStack{
                    Text("Distress : ")
                        .font(Font.custom(nameSemiBold, size: 16))
                        .foregroundColor(.black)
                    
                    Spacer()
                    Text(triages.distress?.rawValue ?? " ")
                        .font(Font.custom(nameBold, size: 16))
                        .foregroundColor(convertHelper.disToColor(input: triages.distress!))
                    
                }
                
                
                HStack{
                    Text("Respiratory rate : ")
                        .font(Font.custom(nameSemiBold, size: 16))
                        .foregroundColor(.black)
                    
                    Spacer()
                    Text(triages.respiratoryRate?.rawValue ?? " ")
                        .font(Font.custom(nameBold, size: 16))
                        .foregroundColor(convertHelper.rrToColor(input: triages.respiratoryRate!))
                    
                }
                
                HStack{
                    Text("Breathing : ")
                        .font(Font.custom(nameSemiBold, size: 16))
                        .foregroundColor(.black)
                    
                    Spacer()
                    Text(triages.hentiNafas?.rawValue ?? " ")
                        .font(Font.custom(nameBold, size: 16))
                        .foregroundColor(convertHelper.hnToColor(input: triages.hentiNafas!))
                    
                }
                
                HStack{
                    Text("Hipoventilation : ")
                        .font(Font.custom(nameSemiBold, size: 16))
                        .foregroundColor(.black)
                    
                    Spacer()
                    Text(triages.hipoventilasi?.description ?? " ")
                        .font(Font.custom(nameBold, size: 16))
                        .foregroundColor(convertHelper.hvToColor(input: triages.hipoventilasi!))
                    
                }
                
                HStack{
                    Text("Hemodynamic : ")
                        .font(Font.custom(nameSemiBold, size: 16))
                        .foregroundColor(.black)
                    
                    Spacer()
                    Text(triages.hemodinamik?.rawValue ?? " ")
                        .font(Font.custom(nameBold, size: 16))
                        .foregroundColor(convertHelper.hdToColor(input: triages.hemodinamik!))
                    
                }
                
                HStack{
                    Text("Pulse : ")
                        .font(Font.custom(nameSemiBold, size: 16))
                        .foregroundColor(.black)
                    
                    Spacer()
                    Text(triages.nadi?.rawValue ?? " ")
                        .font(Font.custom(nameBold, size: 16))
                        .foregroundColor(convertHelper.nadiToColor(input: triages.nadi!))
                    
                }
                
                HStack{
                    Text("Palpitation : ")
                        .font(Font.custom(nameSemiBold, size: 16))
                        .foregroundColor(.black)
                    
                    Spacer()
                    Text(triages.denyutNadi?.rawValue ?? " ")
                        .font(Font.custom(nameBold, size: 16))
                        .foregroundColor(convertHelper.bleedingToColor(input: triages.denyutNadi!))
                    
                }
                
                HStack{
                    Text("Skin condition : ")
                        .font(Font.custom(nameSemiBold, size: 16))
                        .foregroundColor(.black)
                    
                    Spacer()
                    Text(triages.warnaKulit?.rawValue ?? " ")
                        .font(Font.custom(nameBold, size: 16))
                        .foregroundColor(convertHelper.wkToColor(input: triages.warnaKulit!))
                    
                }
                Group{
                    HStack{
                        Text("tanggal create : ")
                            .font(Font.custom(nameSemiBold, size: 16))
                            .foregroundColor(.black)
                        
                        Spacer()
                        Text(triages.warnaKulit?.rawValue ?? " ")
                            .font(Font.custom(nameBold, size: 16))
                            .foregroundColor(convertHelper.wkToColor(input: triages.warnaKulit!))
                        
                    }
                    
                    HStack{
                        Text("GCS : ")
                            .font(Font.custom(nameSemiBold, size: 16))
                            .foregroundColor(.black)
                        
                        Spacer()
                        Text("\((triages.gcs.rawValue))")
                            .font(Font.custom(nameBold, size: 16))
                            .foregroundColor(convertHelper.gcsToColor(input: triages.gcs))
                        
                    }
                }
                
                //VSTACK MAXIMUM IS 10==================
                
                
            }.padding(.horizontal, 30)
            
            HStack{
                Text("Psychological : ")
                    .font(Font.custom(nameSemiBold, size: 16))
                    .foregroundColor(.black)
                Spacer()
                Text(triages.psikologis?.rawValue ?? " ")
                    .font(Font.custom(nameBold, size: 16))
                    .foregroundColor(convertHelper.psiToColor(input: triages.psikologis!))
            }.padding(.horizontal, 30)
            
            
            
            
            //add
        }.position(x: UIScreen.main.bounds.midX)
    }
}

struct ViewTwo: View {
    var triages: Triage
    var helper = RealtimeDBController()
    var patientID: String?
    @State var stateChanged: Bool = false
    @Binding var rootIsActive: Bool
    
    var body: some View {
        if  triages.patientState?.rawValue ==  "Queue" && self.stateChanged == false {
            Button(action: {
                helper.changePatientState(hospitalID: "SILOAM2122", id: (patientID ?? triages.id)!, state: "Handled")
                self.stateChanged = true
            }, label: {
                ZStack{
                    colorPurple
                        .frame(width: 336, height: 57, alignment: .center)
                        .cornerRadius(24)
                    Text("Handle")
                        .font(Font.custom(nameBold, size: 16))
                        .foregroundColor(.white)
                }
            })
        } else if triages.patientState?.rawValue ==  "Queue" && self.stateChanged == true {
            Button (action: {
                self.rootIsActive = false
            },
                           label: {
                               ZStack{
                                   colorPurple
                                       .frame(width: 336, height: 57, alignment: .center)
                                       .cornerRadius(24)
                                   Text("Home")
                                       .font(Font.custom(nameBold, size: 16))
                                       .foregroundColor(.white)
                               }
                           })
        }
        
        if   triages.patientState?.rawValue ==  "Handled"{
            Button(action: {
                helper.changePatientState(hospitalID: "SILOAM2122", id: (patientID ?? triages.id)!, state: "Done")
            }, label: {
                ZStack{
                    colorPurple
                        .frame(width: 336, height: 57, alignment: .center)
                        .cornerRadius(24)
                    Text("Done")
                        .font(Font.custom(nameBold, size: 16))
                        .foregroundColor(.white)
                }
            })
        }
    }
}
