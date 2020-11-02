//
//  LapHarianView.swift
//  triafriends
//
//  Created by Iswandi Saputra on 26/10/20.
//

import SwiftUI

struct HistoryView: View {
    @State var showSignInForm = false
    
    let reports: [Report]
    
    var body: some View {
        NavigationView{
            ScrollView{
                TopPageView(reports:reports)
                HStack{
                    Text("Popular Apps")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .padding(.leading)
                    Spacer()
                }
                AppPageView()
            }
            .sheet(isPresented: $showSignInForm) {
                Code()
            }
            .navigationBarItems(trailing: Button(action: {
                                                    self.showSignInForm.toggle() }){
                Image(systemName: "person.circle")
            })
            .navigationBarTitle("Laporan")
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(reports: Report.all())
    }
}

struct TopPageView: View {
    let reports: [Report]
    var body: some View {
        HStack {
            Image(systemName: "arrow.left.circle").font(.title).padding(.leading,50)
            TabView{
                ForEach(0 ..< 5) { _ in
                    VStack{
                        HStack(alignment: .lastTextBaseline){
                            ForEach(self.reports,id:\.year){ report in
                                BarView(report:report)
                                
                            }
                        }
                        
                    }
                }.padding()
            }
            .frame(width: UIScreen.main.bounds.width - 80, height: 270)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            Image(systemName: "arrow.right.circle").font(.title).padding(.trailing,50)
        }
    }
}

struct BarView: View {
    let report : Report
    var body: some View {
        let value = report.revenue / 500
        let yValue = Swift.min(value * 20, 500)
        return VStack{
            Text(String(format: "$%.2f", report.revenue))
            if report.revenue < 500 {
                Rectangle().fill(
                    
                    Color.red).frame(width: 100, height: CGFloat(yValue))
            }else if report.revenue == 500{
                
                Rectangle().fill(
                    
                    Color.green).frame(width: 100, height: CGFloat(yValue))
            }
            else {
                Rectangle().fill(
                    
                    Color.blue).frame(width: 100, height: CGFloat(yValue))
            }
            Text(report.year)
            
        }
        
    }
}
//
//struct TopPageView: View {
//    var body: some View {
//        TabView{
//            ForEach(0 ..< 5) { _ in
//                VStack{
//                    HStack{
//                        VStack(alignment: .leading){
//                            Text("some app").bold()
//                            Text("Details and stuff").foregroundColor(.secondary)
//                        }
//                        Spacer()
//                    }
//                    RoundedRectangle(cornerRadius: 8, style: .continuous)
//                }
//            }.padding()
//        }
//        .frame(width: UIScreen.main.bounds.width, height: 270)
//        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//    }
//}
struct AppPageView: View {
    var body: some View {
        TabView{
            ForEach(0 ..< 5) { _ in
                VStack {
                    AppCellView()
                    AppCellView()
                    AppCellView()
                    AppCellView()
                }
                
                
                
            }.padding()
        }
        .frame(width: UIScreen.main.bounds.width, height: 270)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct AppCellView: View {
    var body: some View {
        HStack{
            RoundedRectangle(cornerRadius: 8, style: .continuous).frame(width: 60, height: 60)
            VStack(alignment: .leading){
                Text("Today").bold()
                Text("Details and stuff").foregroundColor(.secondary)
            }
            Spacer()
            Image(systemName: "icloud.and.arrow.down").font(.title)
        }
        
    }
}
