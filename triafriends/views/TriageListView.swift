//
//  triageRiw.swift
//  swiftui1
//
//  Created by Abigail Aryaputra Sudarman on 20/10/20.
//

import SwiftUI
import Combine


struct TriageListView: View {
    
    @ObservedObject var triageListViewModel: TriageListViewModel = TriageListViewModel.sharedInstance
    
    var filteredQueue: Filter.Filters = .all
    var creationDate: Date?
    
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
        case .red:
            return triageListViewModel.arrOfTriages.filter { (item) -> Bool in
                return item.status == 2
            }
        case .yellow:
            return triageListViewModel.arrOfTriages.filter { (item) -> Bool in
                return item.status == 1
            }
        case .green:
            return triageListViewModel.arrOfTriages.filter { (item) -> Bool in
                return item.status == 0
            }
        case .date:
            return triageListViewModel.arrOfTriages.filter { (item) -> Bool in
                return item.status == 0
                //NOTCONFIGURED
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
                                    statToColor(stat: triages.status ?? 0)
                                        .frame(width: 26, height: 25, alignment: .top)
                                        .cornerRadius(radius)
                                    
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
    func statToColor(stat: Int) -> Color {
        var color: Color = .white
        
        if stat == 0 {
            color = colorGreen
        } else if stat == 1 {
            color = colorYellow
        } else if stat == 2 {
            color = colorRed
        }
        return color
    }
}

struct triageList_Previews: PreviewProvider {
    static var previews: some View {
        TriageListView()
    }
}

