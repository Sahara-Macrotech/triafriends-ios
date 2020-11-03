//
//  ContentView.swift
//  swiftui1
//
//  Created by Abigail Aryaputra Sudarman on 19/10/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var tvm = TriageListViewModel()
    var helper = RealtimeDBController()
    var accountData = AccountData()
    var dummyUID = "t7SQhXlozrMnWOghRaXHh4HWuUC3"
    var body: some View {
        //DUMMY
        let hospitalID = "SILOAM2122"
        
        
        NavigationView{
            
            ZStack{
                
                VStack{
                    Spacer()
                    HStack{
                        
                    Text(accountData.username)
                        .font(.custom(nameExtraBold, size: 36))
                        Spacer()
                        NavigationLink(
                            destination: Profile(),
                            label: {
                                Image("1")
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
                        })
                    }.padding(.horizontal)
                    
                    Spacer()
                   
                    ExtractedView()
                    
                    TriageListView()
                        .cornerRadius(0)
                        .scaleEffect(CGSize(width: 1, height: 1))
                    
                    //Title Laporan Harian and button
                    HStack{
                        Text("Laporan Harian")
                            .font(.title2)
                            .bold()
                        
                        Spacer()
                        
                        //Dummy button
                        NavigationLink(
                            destination: ListAllView(selectedColoumn: .queue),
                            label: {
                                Text("Lihat semua")
                            })
                        
                    }
                    .padding(.horizontal)
                    Spacer()
                    
                    //Horizontal View Stack  laporan harian
                    HStack{
                        ReportView()
                            .scaleEffect(0.8)
                        Spacer()
                        ReportView()
                            .scaleEffect(0.8)
                    }
                    
                    
                }
               
                
                
              
            }.padding(.bottom, 20)
            
           
        }.onAppear(perform: {
            helper.queryProfile(uid: dummyUID)
        })
        .navigationBarHidden(true)
        
        
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
                    destination: ListAllView(selectedColoumn: .all),
                    label: {
                        Text("Lihat semua")
                        
                    })
            }
            .padding(.horizontal)
        }
    }
}
