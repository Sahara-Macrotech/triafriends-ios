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
                                    
                                    Text("TST")
                                        .font(Font.custom(nameExtraBold, size: 10))
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
                                        .frame(width: 46, height: 16, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    Text("\(triages!.startTime)")
                                        .font(Font.custom(nameBold, size: 10))
                                        .foregroundColor(.white)
                                    
                                }
                                Text("End:")
                                    .font(Font.custom(nameBold, size: 12))
                                ZStack{
                                    colorLightGreen
                                        .cornerRadius(10)
                                        .frame(width: 46, height: 16, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
                        Text(triages?.jalanNafas?.rawValue ?? " ")
                            .font(Font.custom(nameBold, size: 16))
                            .foregroundColor(colorPurple)
                        
                    }
                    
                    
                    
                    HStack{
                        Text("Distress : ")
                            .font(Font.custom(nameSemiBold, size: 16))
                            .foregroundColor(.black)
                        
                        Spacer()
                        Text(triages?.distress?.rawValue ?? " ")
                            .font(Font.custom(nameBold, size: 16))
                            .foregroundColor(colorPurple)
                        
                    }
                    
                    
                    HStack{
                        Text("Respiratory rate : ")
                            .font(Font.custom(nameSemiBold, size: 16))
                            .foregroundColor(.black)
                        
                        Spacer()
                        Text(triages?.respiratoryRate?.rawValue ?? " ")
                            .font(Font.custom(nameBold, size: 16))
                            .foregroundColor(colorPurple)
                        
                    }
                    
                    HStack{
                        Text("Breathing : ")
                            .font(Font.custom(nameSemiBold, size: 16))
                            .foregroundColor(.black)
                        
                        Spacer()
                        Text(triages?.hentiNafas?.rawValue ?? " ")
                            .font(Font.custom(nameBold, size: 16))
                            .foregroundColor(colorPurple)
                        
                    }
                    
                    HStack{
                        Text("Hipoventilation : ")
                            .font(Font.custom(nameSemiBold, size: 16))
                            .foregroundColor(.black)
                        
                        Spacer()
                        Text(triages?.hipoventilasi?.description ?? " ")
                            .font(Font.custom(nameBold, size: 16))
                            .foregroundColor(colorPurple)
                        
                    }
                    
                    HStack{
                        Text("Hemodynamic : ")
                            .font(Font.custom(nameSemiBold, size: 16))
                            .foregroundColor(.black)
                        
                        Spacer()
                        Text(triages?.hemodinamik?.rawValue ?? " ")
                            .font(Font.custom(nameBold, size: 16))
                            .foregroundColor(colorPurple)
                        
                    }
                    
                    HStack{
                        Text("Pulse : ")
                            .font(Font.custom(nameSemiBold, size: 16))
                            .foregroundColor(.black)
                        
                        Spacer()
                        Text(triages?.nadi?.rawValue ?? " ")
                            .font(Font.custom(nameBold, size: 16))
                            .foregroundColor(colorPurple)
                        
                    }
                    
                    HStack{
                        Text("Palpitation : ")
                            .font(Font.custom(nameSemiBold, size: 16))
                            .foregroundColor(.black)
                        
                        Spacer()
                        Text(triages?.denyutNadi?.rawValue ?? " ")
                            .font(Font.custom(nameBold, size: 16))
                            .foregroundColor(colorPurple)
                        
                    }
                    
                    HStack{
                        Text("Skin condition : ")
                            .font(Font.custom(nameSemiBold, size: 16))
                            .foregroundColor(.black)
                        
                        Spacer()
                        Text(triages?.warnaKulit?.rawValue ?? " ")
                            .font(Font.custom(nameBold, size: 16))
                            .foregroundColor(colorPurple)
                        
                    }
                    Group{
                        HStack{
                            Text("tanggal create : ")
                                .font(Font.custom(nameSemiBold, size: 16))
                                .foregroundColor(.black)
                            
                            Spacer()
                            Text(triages?.warnaKulit?.rawValue ?? " ")
                                .font(Font.custom(nameBold, size: 16))
                                .foregroundColor(colorPurple)
                            
                        }
                        
                        HStack{
                            Text("GCS : ")
                                .font(Font.custom(nameSemiBold, size: 16))
                                .foregroundColor(.black)
                            
                            Spacer()
                            Text("\((triages?.gcs.rawValue)!)")
                                .font(Font.custom(nameBold, size: 16))
                                .foregroundColor(colorPurple)
                            
                        }
                    }
                    
                    //VSTACK MAXIMUM IS 10==================
                    
                    
                }.padding(.horizontal, 30)
                
                HStack{
                    Text("Psychological : ")
                        .font(Font.custom(nameSemiBold, size: 16))
                        .foregroundColor(.black)
                    Spacer()
                    Text(triages?.psikologis?.rawValue ?? " ")
                        .font(Font.custom(nameBold, size: 16))
                        .foregroundColor(colorPurple)
                }.padding(.horizontal, 30)
                
                
                
                
                //add
            }.position(x: UIScreen.main.bounds.midX)
            
            
            
            if  ((triages?.patientState?.rawValue ==  "Queue") && (self.stateChanged == false)) {
                Button(action: {
                    helper.changePatientState(hospitalID: "SILOAM2122", id: (patientID ?? triages?.id)!, state: "Handled")
                    self.stateChanged = true
                }, label: {
                    ZStack{
                        colorPurple
                            .frame(width: 336, height: 57, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(24)
                        Text("Handle")
                            .font(Font.custom(nameBold, size: 16))
                            .foregroundColor(.white)
                    }
                })
            } else if ((triages?.patientState?.rawValue ==  "Queue") && (self.stateChanged == true)) {
                NavigationLink(destination: MainViewApp(),
                               label: {
                                   ZStack{
                                       colorPurple
                                           .frame(width: 336, height: 57, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                           .cornerRadius(24)
                                       Text("Home")
                                           .font(Font.custom(nameBold, size: 16))
                                           .foregroundColor(.white)
                                   }
                               })
            }
            
            if   triages?.patientState?.rawValue ==  "Handled"{
                Button(action: {
                    helper.changePatientState(hospitalID: "SILOAM2122", id: (patientID ?? triages?.id)!, state: "Done")
                }, label: {
                    ZStack{
                        colorPurple
                            .frame(width: 336, height: 57, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(24)
                        Text("Done")
                            .font(Font.custom(nameBold, size: 16))
                            .foregroundColor(.white)
                    }
                })
            }
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
    
    
    
    
    
    
    func airToColor(input: Triage.JalanNafas) -> Color {
        var color: Color
        
        if input == .paten {
            color = colorGreen
        } else {
            color = colorRed
        }
        return color
    }
    
    func disToColor(input: Triage.Distress) -> Color {
        var color: Color
        
        if input == .RRnormal{
            color = colorGreen
        } else if input == .tidakAda || input == .ringan {
            color = colorYellow
        } else {
            color = colorRed
        }
        return color
    }
    
    func rrToColor(input: Triage.RespiratoryRate) -> Color {
        var color: Color
        
        if input == .komunikasiBaik {
            color = colorGreen
        } else if input == .RRnormal || input == .RRlessthan30 {
            color = colorYellow
        } else {
            color = colorRed
        }
        return color
    }
    
    func hnToColor(input: Triage.HentiNafas) -> Color{
        var color: Color
        
        if input == .normal {
            color = colorGreen
        } else {
            color = colorRed
        }
        return color
    }
    
    func hvToColor(input: Bool) -> Color {
        var color: Color
        
        if input == false {
            color = colorGreen
        } else {
            color = colorRed
        }
        return color
    }
    
    func hdToColor(input: Triage.Hemodinamik) -> Color{
        var color: Color
        
        if input == .tidakAda {
            color = colorGreen
        } else if input == .ringan {
            color = colorYellow
        } else {
            color = colorRed
        }
        
        return color
    }
    
    func nadiToColor(input: Triage.Nadi) -> Color{
        var color: Color
        
        if input == .normal {
            color = colorGreen
        } else if input == .teraba || input == .lemahKuat {
            color = colorYellow
        } else {
            color = colorRed
        }
        return color
    }
    
    func bleedingToColor(input: Triage.DenyutNadi) -> Color {
        var color: Color
        
        if input == .teraba {
            color = colorGreen
            
        } else if input == .kapilerLessthan2 {
            color = colorYellow
        } else {
            color = colorRed
        }
        return color
    }
    
    func wkToColor(input: Triage.WarnaKulit) -> Color{
        var color: Color
        
        if input == .merahHangat {
            color = colorGreen
        } else {
            color = colorYellow
        }
        return color
    }
    
    func gcsToColor(input: Triage.GCS) -> Color {
        
        var color: Color
        
        if input == .fifteen {
            color = colorGreen
        } else if input == .aboveThirteen {
            color = colorYellow
        } else {
            color = colorRed
        }
        return color
    }
    
    
    
    
    //PSI COLOR
    func psiToColor(input: Triage.Psikologis) -> Color{
        var color: Color
        
        if input == .kooperatif {
            color = colorGreen
        } else {
            color = colorYellow
        }
        return color
    }
    
    
}


struct PatientDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PatientDetailView()
            .previewDevice("iPhone 11 Pro")
    }
}
