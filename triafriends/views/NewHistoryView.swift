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
    @State var showsDatePicker = false
        let dateFormatter: DateFormatter = {
            let df = DateFormatter()
            df.dateStyle = .medium
            return df
        }()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    
                    HStack {
                        Text("Date of Birth")
                        Spacer()
                        Text("\(dateFormatter.string(from: Date()))")
                            .onTapGesture {
                                self.showsDatePicker.toggle()
                            }
                            .padding(EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 10))
                            .background(showsDatePicker
                                            ? Color.clear
                                            : Color.gray)
                    }
                     
                    HStack(spacing: 20) {
                        DonutChart(dataModel: ChartDataModel.init(dataModel: sample), onTap: {
                            dataModel in
                            if let dataModel = dataModel {
                                self.selectedDonut = "Subject: \(dataModel.name)\nPointes: \(dataModel.value)"
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
                }
            }.navigationBarTitle("History Report")
        }
    }
}

struct NewHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        NewHistoryView()
    }
}
