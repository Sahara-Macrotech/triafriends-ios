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
    var startDate: Date?
    var endDate: Date?
    
    var filteredTriages: [Triage] {
        switch filteredQueue {
        case .done:
            return triageListViewModel.arrOfTriages.filter { (item) in
                var now = item.date
                var today = Date().addingTimeInterval(25200)
                
            
                let startOfDay = Date().startOfDay.addingTimeInterval(25200)
                print(startOfDay)
                
                
                let range = startOfDay...today
                
                return item.patientState == .done && range.contains(now!)
            }
        case .handled:
            return triageListViewModel.arrOfTriages.filter { (item) -> Bool in
                
                var now = item.date
                var today = Date().addingTimeInterval(25200)
                
            
                let startOfDay = Date().startOfDay.addingTimeInterval(25200)
                print(startOfDay)
                
                
                let range = startOfDay...today
                
                return item.patientState == .handled && range.contains(now!)
            }
        case .queue:
            return triageListViewModel.arrOfTriages.filter { (item) -> Bool in
                var now = item.date
                var today = Date().addingTimeInterval(25200)
                
            
                let startOfDay = Date().startOfDay.addingTimeInterval(25200)
                print(startOfDay)
                
                
                let range = startOfDay...today
                
                return item.patientState == .queue && range.contains(now!)
            }
        case .red:
            return triageListViewModel.arrOfTriages.filter { (item) -> Bool in
                var start = startDate ?? Date(timeIntervalSince1970: 5000)
                var end = endDate ?? Date(timeIntervalSince1970: 5000000000)
                var now = item.date
                var range = start...end
                return item.status == 1 && range.contains(now!) || item.status == 2 && range.contains(now!)
            }
        case .yellow:
            return triageListViewModel.arrOfTriages.filter { (item) -> Bool in
                var start = startDate ?? Date(timeIntervalSince1970: 5000)
                var end = endDate ?? Date(timeIntervalSince1970: 5000000000)
                var now = item.date
                var range = start...end
                return item.status == 3 && range.contains(now!) || item.status == 4 && range.contains(now!)
            }
        case .green:
            return triageListViewModel.arrOfTriages.filter { (item) -> Bool in
                var start = startDate ?? Date(timeIntervalSince1970: 5000)
                var end = endDate ?? Date(timeIntervalSince1970: 5000000000)
                var now = item.date
                var range = start...end
                return item.status == 5 && range.contains(now!)
            }
        case .limitToFive:
            var x = triageListViewModel.arrOfTriages.filter { (item) -> Bool in
               
             
                var now = item.date
                var today = Date().addingTimeInterval(25200)
                
            
                let startOfDay = Date().startOfDay.addingTimeInterval(25200)
                print(startOfDay)
                
                
                let range = startOfDay...today
                return range.contains(item.date!) && item.patientState == .queue
            }
          
            x.sort {
                $0.status! < $1.status!
            }
            
           
            return Array(x.prefix(5))
            
             
            
            //TODO, sort this like .limitToFive
        case .all:
            var x = triageListViewModel.arrOfTriages.filter { (item) -> Bool in
               
             
                var now = item.date
                var today = Date().addingTimeInterval(25200)
                
            
                let startOfDay = Date().startOfDay.addingTimeInterval(25200)
                print(startOfDay)
                
                
                let range = startOfDay...today
                return range.contains(item.date!)
            }
            x.sort {
                $0.status! < $1.status!
            }
            
            return x
            
        case .black:
            return triageListViewModel.arrOfTriages.filter { (item) -> Bool in
                var start = startDate ?? Date(timeIntervalSince1970: 5000)
                var end = endDate ?? Date(timeIntervalSince1970: 5000000000)
                var now = item.date
                var range = start...end
                return item.status == 6 && range.contains(now!)
            }
        case .dateOnly:
            return triageListViewModel.arrOfTriages.filter { (item) -> Bool in
                var start = startDate ?? Date(timeIntervalSince1970: 5000)
                var end = endDate ?? Date(timeIntervalSince1970: 5000000000)
                var now = item.date
                var range = start...end
                return range.contains(now!)
            }
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
                                    VStack(alignment: .leading, spacing: 2) {
                                        
                                    
                                        Text(triages.name!)
                                        .font(Font.custom(nameBold, size: 16))
                                        Text("Category \(triages.status!)")
                                            .font(.custom(nameSemiBold, size: 10))
                                            .foregroundColor(colorTextGray)
                                    }
                                    
                                    Spacer()
                                    //TODO : ganti image jadi color yang sudah diset interface
                                    statToColor(stat: triages.status ?? 0)
                                        .frame(width: 26, height: 25, alignment: .top)
                                        .cornerRadius(radius)
                                    
                                }.padding(.horizontal)
                                .padding(.vertical, 7)
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
        
        if stat == 5 {
            color = colorGreen
        } else if stat == 3 || stat == 4 {
            color = colorYellow
        } else if stat == 1 || stat == 2 {
            color = colorRed
        } else {
            color = .black
        }
        return color
    }
}
func getTextFromDate(_ date: Date?) -> String {
    if date == nil { return "" }
    let formatter = DateFormatter()
    formatter.timeZone = TimeZone.current
    formatter.locale = Locale.current
    formatter.dateFormat = "EEEE, MMMM d, yyyy"
    return formatter.string(from: date!)
}


struct triageList_Previews: PreviewProvider {
    static var previews: some View {
        TriageListView()
    }
}

extension Date {
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }

    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }
}
