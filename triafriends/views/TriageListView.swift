//
//  triageRiw.swift
//  swiftui1
//
//  Created by Abigail Aryaputra Sudarman on 20/10/20.
//

import SwiftUI
import Combine


struct TriageListView: View {
    
    @ObservedObject var triageListViewModel = TriageListViewModel()
    
    var filteredQueue: Filter.Filters = .queue
    

    
    
    var filteredTriages: [Triage] {
        switch filteredQueue {
        case .done:
            return triageListViewModel.arrOfTriages.filter { (item) in
                return item.patientState == .done
            }
        case .handled:
            return triageListViewModel.arrOfTriages.filter { (item) -> Bool in
                return item.patientState == .handled
            }
        case .queue:
            return triageListViewModel.arrOfTriages.filter { (item) -> Bool in
                return item.patientState == .queue
            }

        case .all:
            return triageListViewModel.arrOfTriages
        }
    }
    
 
    
    
    
    
    
    var body: some View {

        
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
                                    Text(triages.name!)
                                        .font(Font.custom(nameBold, size: 16))
                                    
                                    Spacer()
                                    //TODO : ganti image jadi color yang sudah diset interface
                                    Image("\(triages.status ?? 0)")
                                        .resizable()
                                        .frame(width: 26, height: 25, alignment: .top)
                                        .cornerRadius(6)
                                }.padding()
                            }
                        }
                    }.padding()
                    .onAppear(perform: {
                        let hospitalID = "SILOAM2122"
                            triageListViewModel.query(hospitalID: hospitalID)
                          
                        })
                }
            }
        }
    }
}

struct triageList_Previews: PreviewProvider {
    static var previews: some View {
        TriageListView()
    }
}

