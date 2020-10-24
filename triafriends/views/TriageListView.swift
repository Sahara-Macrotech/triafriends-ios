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
            
            
            
            
            VStack(alignment: .center, spacing: nil) {
               
                
                
                ScrollView{
                ForEach(triages) { triages in
                    VStack{
                        
                        //example--------------
                        ZStack{
                        
                        //Rectangle()
                        Color(hue: 0, saturation: 0, brightness: 0.8)
                            .cornerRadius(20)
                        HStack{
                            Text(triages.name)
                            
                            Spacer()
                            Image("\(triages.status)")
                                .resizable()
                                .frame(width: 25, height: 25, alignment: .top)
                                .cornerRadius(10)
                   
                        }.padding()
                    }
                        
                        
                        
                    }
                    
                    
                }.padding()
                
                
               
                }
                
              
                
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
