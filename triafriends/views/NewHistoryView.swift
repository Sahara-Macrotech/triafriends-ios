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
                        colorPurple.frame(width: UIScreen.main.bounds.maxX, height: 248)
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
                                        if rkManager2.startDate == nil {
                                            Text(getDate()).font(.footnote).bold()
                                                .foregroundColor(Color.white)
                                                .multilineTextAlignment(.leading)
                                                .padding(.leading,5) }
                                        else{
                                            Text(getTextFromDate(rkManager2.startDate)+" - "+getTextFromDate(rkManager2.endDate)).font(.footnote).bold()
                                                .foregroundColor(Color.white)
                                                .multilineTextAlignment(.leading)
                                                .padding(.leading,5)
                                            
                                        }
                                            
                                        //                                        //Text("green is higher than any color")
                                        //                                            .font(.footnote)
                                        //                                            .foregroundColor(Color.white)
                                        //                                            .multilineTextAlignment(.leading)
                                        
                                    }
                                }
                                .sheet(isPresented: $isPresented2) { RKViewController().environmentObject(rkManager2) }.onDisappear {
                                    colorFilter = .dateOnly
                                    
                                }
//                                VStack {
//                                    Text(getTextFromDate(rkManager2.startDate)).font(.footnote)
//                                    Text(getTextFromDate(rkManager2.endDate)).font(.footnote)
//                                }
//
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
                        ZStack{
                            Circle()
                                .frame(width: 150, height: 150, alignment: .center)
                                .foregroundColor(.gray)
                            
                            DonutChart(dataModel: ChartDataModel.init(dataModel: [ ChartCellModel(color: colorRed, value: CGFloat(cvm.getNumbersForChart(startDate: rkManager2.startDate ?? Date(timeIntervalSince1970: 500), endDate: rkManager2.endDate ?? Date(timeIntervalSince1970: 500000000000)).r), name: "Gawat Darurat"),
                                                                                   ChartCellModel(color: colorYellow, value: CGFloat(cvm.getNumbersForChart(startDate: rkManager2.startDate ?? Date(timeIntervalSince1970: 500), endDate: rkManager2.endDate ?? Date(timeIntervalSince1970: 500000000000)).y), name: "Gawat Tidak Darurat"),
                                                                                   
                                                                                   ChartCellModel(color: colorGreen, value: CGFloat(cvm.getNumbersForChart(startDate: rkManager2.startDate ?? Date(timeIntervalSince1970: 500), endDate: rkManager2.endDate ?? Date(timeIntervalSince1970: 500000000000)).g), name: "Darurat Tidak Gawat"),
                                                                                   ChartCellModel(color: Color.black, value: CGFloat(cvm.getNumbersForChart(startDate: rkManager2.startDate ?? Date(timeIntervalSince1970: 500), endDate: rkManager2.endDate ?? Date(timeIntervalSince1970: 500000000000)).b), name: "Mati") ]), onTap: {
                                                                                    dataModel in
                                                                                    if let dataModel = dataModel {
                                                                                        self.selectedDonut = "Subject: \(dataModel.name)\nAmount: \(Int(dataModel.value)) people(s)"
                                                                                        //print(dataModel.color)
                                                                                        colorNameToFilter(color: dataModel.color)
                                                                                        
                                                                                    } else {
                                                                                        self.selectedDonut = ""
                                                                                        
                                                                                    }
                                                                                   })
                                
                                .frame(width: 150, height: 150, alignment: .center)
                                .padding()
                            
                            
                        }
                        Text(selectedDonut)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    Spacer()
                    
                    HStack {
                        
                        //let formattedFloat = String(format: "%.0f", dataSet.value)
                        VStack {
                            Circle().foregroundColor(colorRed)
                            Text("\(cvm.getNumbersForChart(startDate: rkManager2.startDate ?? Date(timeIntervalSince1970: 500), endDate: rkManager2.endDate ?? Date(timeIntervalSince1970: 500000000000)).r)")
                                .font(.footnote)
                            
                        }
                        
                        VStack {
                            Circle().foregroundColor(colorYellow)
                            Text("\(cvm.getNumbersForChart(startDate: rkManager2.startDate ?? Date(timeIntervalSince1970: 500), endDate: rkManager2.endDate ?? Date(timeIntervalSince1970: 500000000000)).y)")
                                .font(.footnote)
                            
                        }
                        
                        VStack {
                            Circle().foregroundColor(colorGreen)
                            Text("\(cvm.getNumbersForChart(startDate: rkManager2.startDate ?? Date(timeIntervalSince1970: 500), endDate: rkManager2.endDate ?? Date(timeIntervalSince1970: 500000000000)).g)")
                                .font(.footnote)
                            
                        }
                        
                        VStack {
                            Circle().foregroundColor(.black)
                            Text("\(cvm.getNumbersForChart(startDate: rkManager2.startDate ?? Date(timeIntervalSince1970: 500), endDate: rkManager2.endDate ?? Date(timeIntervalSince1970: 500000000000)).b)")
                                .font(.footnote)
                            
                        }
                        
                    }
                    
                    TriageListView(filteredQueue: colorFilter ?? .all,startDate: rkManager2.startDate, endDate: rkManager2.endDate)
                        .frame(width: 400, height: 300, alignment: .center)
                }
                .onAppear(perform: {
                    
                })
            }
            .edgesIgnoringSafeArea([.top, .bottom])
        }.onAppear(perform: {
            
            //            sample[2].value = CGFloat(cvm.getNumbersForChart(startDate: rkManager2.startDate ?? Date(timeIntervalSince1970: 500), endDate: rkManager2.endDate ?? Date(timeIntervalSince1970: 500000000000)).g)
            //
            //            sample[1].value = CGFloat(cvm.getNumbersForChart(startDate: rkManager2.startDate ?? Date(timeIntervalSince1970: 500), endDate: rkManager2.endDate ?? Date(timeIntervalSince1970: 500000000000)).y)
            //
            //            sample[0].value = CGFloat(cvm.getNumbersForChart(startDate: rkManager2.startDate ?? Date(timeIntervalSince1970: 500), endDate: rkManager2.endDate ?? Date(timeIntervalSince1970: 500000000000)).r)
            //
            //            sample[3].value = CGFloat(cvm.getNumbersForChart(startDate: rkManager2.startDate ?? Date(timeIntervalSince1970: 500), endDate: rkManager2.endDate ?? Date(timeIntervalSince1970: 500000000000)).b)
        })
        .navigationTitle("")
        .navigationBarHidden(true)
        
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
        //format.timeZone = TimeZone.current
        // format.locale = Locale.current
        return format.string(from: date!)
    }
    func getDate()->String{
        let time = Date()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "MMMM d, yyyy"
        let stringDate = timeFormatter.string(from: time)
        return stringDate
    }
    func getTextFromDate(_ date: Date?) -> String {
        print(date)
        if date == nil { return "" }
        
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.current
        formatter.dateFormat = "MMMM d, yyyy"
//        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter.string(from: date!)
    }
    
    func getTextFromDateTime(_ date: Date?) -> String {
        if date == nil { return "" }
        let formatter = DateFormatter()
        // formatter.timeZone = TimeZone.current
        // formatter.locale = Locale.current
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
