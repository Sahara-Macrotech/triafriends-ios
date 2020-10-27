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
                            NavigationLink(
                                destination: PatientDetailView(triages: triages),
                                label: {
                                    colorLightGray
                                        .cornerRadius(6)
                                    
                                   
                                })
                            
                           
                       
                            
                        HStack{
                            Text(triages.name)
                            
                            Spacer()
                            //TODO : ganti image jadi color yang sudah diset interface
                            Image("\(triages.status)")
                                .resizable()
                                .frame(width: 26, height: 25, alignment: .top)
                                .cornerRadius(6)
                   
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
