//
//  PatientDetailView.swift
//  triafriends
//
//  Created by Abigail Aryaputra Sudarman on 24/10/20.
//

import SwiftUI

struct PatientDetailView: View {
    var triages: Triage?
    //var triageData: TriageData?
    
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
                        colorRed
                            .frame(width: 40, height: 40, alignment: .center)
                            .cornerRadius(radius)
                        
                        
                    }
                    
                }
                .frame(width: 330, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .scaleEffect(/*@START_MENU_TOKEN@*/CGSize(width: 1.0, height: 1.0)/*@END_MENU_TOKEN@*/)
                
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
                        Text("jalan nafas : ")
                            .font(Font.custom(nameSemiBold, size: 16))
                            .foregroundColor(.black)
                        
                        Spacer()
                        Text(triages?.jalanNafas?.rawValue ?? " ")
                            .font(Font.custom(nameBold, size: 16))
                            .foregroundColor(colorPurple)
                        
                    }
                    
                    
                    
                    HStack{
                        Text("distrses : ")
                            .font(Font.custom(nameSemiBold, size: 16))
                            .foregroundColor(.black)
                        
                        Spacer()
                        Text(triages?.distress?.rawValue ?? " ")
                            .font(Font.custom(nameBold, size: 16))
                            .foregroundColor(colorPurple)
                        
                    }
                    
                    
                    HStack{
                        Text("laju pernafasan : ")
                            .font(Font.custom(nameSemiBold, size: 16))
                            .foregroundColor(.black)
                        
                        Spacer()
                        Text(triages?.respiratoryRate?.rawValue ?? " ")
                            .font(Font.custom(nameBold, size: 16))
                            .foregroundColor(colorPurple)
                        
                    }
                    
                    HStack{
                        Text("henti pernafasan : ")
                            .font(Font.custom(nameSemiBold, size: 16))
                            .foregroundColor(.black)
                        
                        Spacer()
                        Text(triages?.hentiNafas?.rawValue ?? " ")
                            .font(Font.custom(nameBold, size: 16))
                            .foregroundColor(colorPurple)
                        
                    }
                    
                    HStack{
                        Text("hipoventilasi : ")
                            .font(Font.custom(nameSemiBold, size: 16))
                            .foregroundColor(.black)
                        
                        Spacer()
                        Text(triages?.hipoventilasi?.description ?? " ")
                            .font(Font.custom(nameBold, size: 16))
                            .foregroundColor(colorPurple)
                        
                    }
                    
                    HStack{
                        Text("hemodinamik : ")
                            .font(Font.custom(nameSemiBold, size: 16))
                            .foregroundColor(.black)
                        
                        Spacer()
                        Text(triages?.hemodinamik?.rawValue ?? " ")
                            .font(Font.custom(nameBold, size: 16))
                            .foregroundColor(colorPurple)
                        
                    }
                    
                    HStack{
                        Text("nadi : ")
                            .font(Font.custom(nameSemiBold, size: 16))
                            .foregroundColor(.black)
                        
                        Spacer()
                        Text(triages?.nadi?.rawValue ?? " ")
                            .font(Font.custom(nameBold, size: 16))
                            .foregroundColor(colorPurple)
                        
                    }
                    
                    HStack{
                        Text("denyut nadi : ")
                            .font(Font.custom(nameSemiBold, size: 16))
                            .foregroundColor(.black)
                        
                        Spacer()
                        Text(triages?.denyutNadi?.rawValue ?? " ")
                            .font(Font.custom(nameBold, size: 16))
                            .foregroundColor(colorPurple)
                        
                    }
                    
                    HStack{
                        Text("warna kulit : ")
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
                        Text("\(triages?.gcs ?? 0)")
                            .font(Font.custom(nameBold, size: 16))
                            .foregroundColor(colorPurple)
                        
                    }
                    
                    //VSTACK MAXIMUM IS 10==================
                    
                    
                }.padding(.horizontal, 30)
                
                HStack{
                    Text("psikologis : ")
                        .font(Font.custom(nameSemiBold, size: 16))
                        .foregroundColor(.black)
                    Spacer()
                    Text(triages?.psikologis?.rawValue ?? " ")
                        .font(Font.custom(nameBold, size: 16))
                        .foregroundColor(colorPurple)
                }.padding(.horizontal, 30)
                
                
                
                
                
            }.position(x: UIScreen.main.bounds.midX)
            
            
            
            
            
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
            .previewDevice("iPhone 11 Pro")
    }
}
