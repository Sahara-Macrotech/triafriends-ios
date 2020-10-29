//
//  triageRiw.swift
//  swiftui1
//
//  Created by Abigail Aryaputra Sudarman on 20/10/20.
//

import SwiftUI


struct TriageListView: View {
    
   
    
    var filteredQueue: Filter.Filters = .all
//    var triageData = triages
    
    var filteredTriages: [Triage] {
        switch filteredQueue {
        case .done:
            return triages.filter { (item) -> Bool in
                return item.patientState == .done
            }
        case .handled:
            return triages.filter { (item) -> Bool in
                return item.patientState == .handled
            }
        case .queue:
            return triages.filter { (item) -> Bool in
                return item.patientState == .queue
            }

        case .all:
            return triages
        }
    }
    
    var body: some View {
//    var filteredPatientState = triages.filter { (item) -> Bool in
//            return item.patientState == filteredQueue
//        }
        
        //
        //arr.filter { (str) -> Bool in
        //    return str.contains("a")
        
        
        
        
        ZStack{
            
            
            
            
            
            VStack(alignment: .center, spacing: nil) {
                
                
                
                ScrollView{
                    
                    ForEach(filteredTriages) { triages in
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
                                        .font(Font.custom(nameBold, size: 16))
                                    
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
            
            
            
        }.onAppear(perform: {
         
            
            
            
        })
        
    }
    
    mutating func setFilter() {
        
    }
    
    
    
}

struct triageList_Previews: PreviewProvider {
    static var previews: some View {
        TriageListView()
    }
}

