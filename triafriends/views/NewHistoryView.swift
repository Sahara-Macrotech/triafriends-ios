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
    let cvm = ChartViewModels()
    
    @State var sample = [ ChartCellModel(color: colorRed, value: 120, name: "Gawat Darurat"),
               ChartCellModel(color: colorYellow, value: 143, name: "Gawat Tidak Darurat"),
               
               ChartCellModel(color: colorGreen, value: 120, name: "Darurat Tidak Gawat"),
               ChartCellModel(color: Color.black, value: 47, name: "Mati") ]
    
    
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
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
                }.onAppear(perform: {
                  
                })
            }.navigationBarTitle("History Report")
        }.onAppear(perform: {
            sample[2].value = CGFloat(cvm.getNumbersForChart().g)
            sample[1].value = CGFloat(cvm.getNumbersForChart().y)
            sample[0].value = CGFloat(cvm.getNumbersForChart().r)
            sample[3].value = CGFloat(cvm.getNumbersForChart().b)
        })
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
