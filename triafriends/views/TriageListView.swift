//
//  triageRiw.swift
//  swiftui1
//
//  Created by Abigail Aryaputra Sudarman on 20/10/20.
//

import SwiftUI

struct TriageListView: View {
    var triageData = triages
    var body: some View {
        
        ZStack{
            
            Color(hue: 0, saturation: 0, brightness: 0.8)
                .ignoresSafeArea()
            
            
            VStack(alignment: .center, spacing: nil) {
               
                Divider()
                Divider()
                
                ScrollView{
                ForEach(triages) { triages in
                    VStack{
                        
                        //example--------------
                        HStack{
                            Text(triages.name)
                            
                            Spacer()
                            Image("\(triages.status)")
                                .resizable()
                                .frame(width: 75, height: 75, alignment: .top)
                                .cornerRadius(15)
                   
                        }.padding()
                        
                        
                        
                    }
                    
                }.padding()
               
                }
                
                Divider()
                Divider()
                
                //-----------
                
                
                
            }
            
            
            
        }
        
    }
}

struct triageList_Previews: PreviewProvider {
    static var previews: some View {
        TriageListView()
    }
}
