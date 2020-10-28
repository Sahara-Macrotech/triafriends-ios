//
//  PatientDetailView.swift
//  triafriends
//
//  Created by Abigail Aryaputra Sudarman on 24/10/20.
//

import SwiftUI

struct PatientDetailView: View {
    var triages: Triage?
    var triageData: TriageData?
    
    var body: some View {
        VStack{
            ZStack{
                colorLightGray
                    .cornerRadius(radius)
                ZStack{
                    
                    
                    HStack{
                        VStack{
                            Spacer(minLength: 15)
                            HStack{
                                Text("triages!.name")
                                    .multilineTextAlignment(.leading)
                                    .font(Font.custom(nameBold, size: 24 ))
                                
                                Spacer()
                            }
                            
                            
                            
                            HStack{
                                ZStack{
                                    
                                    colorLightPurple
                                        .frame(width: 60, height: 30, alignment: .leading)
                                        .cornerRadius(radius)
                                    
                                    Text("test")
                                        .font(Font.custom(nameRegular, size: 20))
                                        .foregroundColor(colorPurple)
                                    
                                    
                                }
                                Spacer()
                            }
                            Spacer(minLength: 20)
                            
                        }.frame(width: 200, height: 100, alignment: .leading)
                        
                        Spacer()
                        colorRed
                            .frame(width: 40, height: 40, alignment: .center)
                            .cornerRadius(radius)
                        
                        
                    }
                    
                }
                .frame(width: 330, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
            }
            .frame(width: 360, height: 100, alignment: .center)
            .position(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.maxY / 10)
            
            
            VStack{
                
                HStack{
                    Text("Triage Check Result")
                        .font(Font.custom(nameBold, size: 24))
                    Spacer()
                    
                }.padding()
                //TO DO :  Bikin loop horizontal dan ambil data dari model
                HStack{
                    Text("pernafasan : ")
                        .font(Font.custom(nameBold, size: 18))
                        .foregroundColor(colorPurple)
                    
                    Spacer()
                    Text(data[0].jalanNafas.rawValue)
                }
                
            }.position(x: UIScreen.main.bounds.midX, y: -120)
            
            
            
            
            Button(action: {}, label: {
                ZStack{
                colorPurple
                    .frame(width: 350, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(24)
                Text("Handle")
                    .font(Font.custom(nameBold, size: 16))
                    .foregroundColor(.white)
            }
            })
            
        }
        
    }
}

struct PatientDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PatientDetailView()
    }
}
