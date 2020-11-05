//
//  NewHistoryView.swift
//  triafriends
//
//  Created by Iswandi Saputra on 02/11/20.
//

import SwiftUI

struct NewHistoryView: View {
    @State var selectedPie: String = ""
    @State var selectedDonut: String = ""
    @State var colorFilter: Filter.Filters?
    @State var isPresented2 = false
    let cvm = ChartViewModels()
    
    @State var sample = [ ChartCellModel(color: colorRed, value: 120, name: "Gawat Darurat"),
                          ChartCellModel(color: colorYellow, value: 143, name: "Gawat Tidak Darurat"),
                          
                          ChartCellModel(color: colorGreen, value: 120, name: "Darurat Tidak Gawat"),
                          ChartCellModel(color: Color.black, value: 47, name: "Mati") ]
    
    @ObservedObject var rkManager2 = RKManager(calendar: Calendar.current, minimumDate: Date().addingTimeInterval(-60*60*24*60), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: .dateRange) // automatically goes to mode=2 after start selection, and vice versa.
    
        
    
    
    var body: some View {
         
        NavigationView {
            ScrollView {
                VStack {
                    
                    ZStack{
//                       Color.init(red: 75/255, green: 39/255, blue: 102/255, opacity: 1) .background(Color.init(red: 75/255, green: 39/255, blue: 102/255, opacity: 1))
                        Color.init(red: 75/255, green: 39/255, blue: 102/255, opacity: 1).frame(width: .infinity, height: 248)
//                        Color.purple.frame(width: .infinity, height: 130)
                        VStack(alignment: .leading){
                            Text("History Report")
                                .font(.title2).bold()
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.leading)
                                .padding(.top,45)
                                .padding(.leading,25)
                                .padding(.bottom,20)
                           
                            HStack( ){
                              
                                Image(systemName: "calendar")
                                    .imageScale(.medium)
                                    .font(Font.title.weight(.regular))
                                    .foregroundColor(.white)
                                    
                                    .padding(.leading,25)
                                Button(action: { isPresented2.toggle() }){
                                    VStack {
                                        Text("October 09 - October 12,2020")
                                            .font(.footnote).bold()
                                            .foregroundColor(Color.white)
                                            .multilineTextAlignment(.leading)
                                            .padding(.leading,5)
                                        Text("green is higher than any color")
                                            .font(.footnote)
                                            .foregroundColor(Color.white)
                                            .multilineTextAlignment(.leading)
                                        
                                    }
                                           }
                                .sheet(isPresented: $isPresented2) { RKViewController().environmentObject(rkManager2) }
                                VStack {
                                    Text(getTextFromDate(rkManager2.startDate)).font(.footnote)
                                    Text(getTextFromDate(rkManager2.endDate)).font(.footnote)
                                }
                             
                                Spacer()
                            }   .padding(.bottom,20)
                        }
                       
//                        .navigationBarTitle("History Report")
                        .frame(alignment: .leading)
                    }
                    //                    HStack(spacing: 20) {
                    //                        PieChart(dataModel: ChartDataModel.init(dataModel: sample), onTap: {
                    //                            dataModel in
                    //                            if let dataModel = dataModel {
                    //                                self.selectedPie = "Subject: \(dataModel.name)\nPointes: \(dataModel.value)"
                    //                            } else {
                    //                                self.selectedPie = ""
                    //                            }
                    //                        })
                    //                            .frame(width: 150, height: 150, alignment: .center)
                    //                            .padding()
                    //                        Text(selectedPie)
                    //                        .font(.footnote)
                    //                        .multilineTextAlignment(.leading)
                    //                        Spacer()
                    //
                    //                    }
                    HStack(spacing: 20) {
                        DonutChart(dataModel: ChartDataModel.init(dataModel: sample), onTap: {
                            dataModel in
                            if let dataModel = dataModel {
                                self.selectedDonut = "Subject: \(dataModel.name)\nAmount: \(Int(dataModel.value)) people(s)"
                                print(dataModel.color)
                                colorNameToFilter(color: dataModel.color)
                                
                            } else {
                                self.selectedDonut = ""
                                
                            }
                        })
                        .frame(width: 150, height: 150, alignment: .center)
                        .padding()
                        Text(selectedDonut)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    Spacer()
                    
                    HStack {
                        
                        ForEach(sample) { dataSet in
                            //                            let moreCount = dataSet.value.count
                            let formattedFloat = String(format: "%.0f", dataSet.value)
                            VStack {
                                Circle().foregroundColor(dataSet.color)
                                Text("\(formattedFloat)").font(.footnote)
                            }
                        }
                    }
                    
                    TriageListView(filteredQueue: colorFilter ?? .all)
                        .frame(width: 400, height: 300, alignment: .center)
                }
                .onAppear(perform: {
                    
                })
            }
            .edgesIgnoringSafeArea([.top, .bottom])
        }.onAppear(perform: {
            sample[2].value = CGFloat(cvm.getNumbersForChart().g)
            sample[1].value = CGFloat(cvm.getNumbersForChart().y)
            sample[0].value = CGFloat(cvm.getNumbersForChart().r)
            sample[3].value = CGFloat(cvm.getNumbersForChart().b)
        })
      
    }
    
    func datesView(dates: [Date], _ withTime: Bool = false) -> some View {
        ScrollView (.horizontal) {
            HStack {
                ForEach(dates, id: \.self) { date in
                    withTime ? Text(getTextFromDateTime(date)) : Text(getTextFromDate(date))
                }
            }
        }.padding(.horizontal, 5)
    }
    func getDateTimeAsString(_ date: Date?) -> String {
        if date == nil { return "" }
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd-HH-mm"
        format.timeZone = TimeZone.current
        format.locale = Locale.current
        return format.string(from: date!)
    }
    
    func getTextFromDate(_ date: Date?) -> String {
        if date == nil { return "" }
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.current
        formatter.dateFormat = "EEEE, MMMM d, yyyy"
        return formatter.string(from: date!)
    }
    
    func getTextFromDateTime(_ date: Date?) -> String {
        if date == nil { return "" }
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.current
        formatter.dateFormat = "EEEE, MMMM d HH:mm, yyyy"
        return formatter.string(from: date!)
    }
    
    func colorNameToFilter(color: Color) {
        
        if color == colorRed {
            colorFilter = .red
        } else if color == colorGreen {
            colorFilter = .green
        } else if color == colorYellow {
            colorFilter = .yellow
        } else if color == .black {
            colorFilter = .black
        }
        //ALL BELUM ADA PILIHANNYA YG RETURN SEMUA
        
    }
}
//
//struct NewHistoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewHistoryView()
//    }
//}

extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}
