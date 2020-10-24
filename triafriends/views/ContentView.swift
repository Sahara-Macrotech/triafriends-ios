//
//  ContentView.swift
//  swiftui1
//
//  Created by Abigail Aryaputra Sudarman on 19/10/20.
//

import SwiftUI

struct ContentView: View {
    
    var accountData = AccountData()
    var body: some View {
        NavigationView{
            
            VStack{
                
                ExtractedView()
                
                TriageListView()
                    .cornerRadius(0)
                    .scaleEffect(CGSize(width: 0.9, height: 0.9))
                
                //Title Laporan Harian and button
                HStack{
                    Text("Laporan Harian")
                        .font(.title2)
                        .bold()
                    
                    Spacer()
                    
                    //Dummy button
                    NavigationLink(
                        destination: TriageListView(),
                        label: {
                            Text("Lihat semua")
                        })
                    
                }
                .padding()
                Spacer()
                    
                //Horizontal View Stack  laporan harian
                HStack{
                    ReportView()
                        .scaleEffect(0.8)
                    Spacer()
                    ReportView()
                        .scaleEffect(0.8)
                }
                .padding()
                
            }
            .navigationTitle(
                Text(accountData.username)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            )
        }
    }
    
    
    
    
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    struct ExtractedView: View {
        var body: some View {
            HStack{
                Text("Prioritas Triase")
                    .font(.title2)
                    .bold()
                
                
                Spacer()
                
                NavigationLink(
                    destination: TriageListView(),
                    label: {
                        Text("Lihat semua")
                    })
            }
            .padding()
        }
    }
}
