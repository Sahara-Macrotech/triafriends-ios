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
                    
                    HStack{
                        Text("Good morning,")
                            .font(.custom(nameRegular, size: 16))
                            .foregroundColor(colorTextGray)
                        
                        Spacer()
                    }.padding(.horizontal)
                    HStack{
                   
    
                    Text(accountData.username)
                        .font(.custom(nameExtraBold, size: 36))
                        
                        Spacer()
                        NavigationLink(
                            destination: Profile(),
                            label: {
                                Image("1")
                                    .clipShape(Circle(), style: FillStyle())
                                    
                        })
                    }.padding(.horizontal)
                    
                     
                    Spacer()
                   
                    ExtractedView()
                    
                    
                    TriageListView()
                        .cornerRadius(0)
                        .frame(width: UIScreen.main.bounds.maxX , height: 400)
                    
                    //Title Laporan Harian and button
                    HStack{
                        Text("Daily report")
                            .font(.title2)
                            .bold()
                        
                        Spacer()
                        
                        //Dummy button
                        NavigationLink(
                            destination: ListAllView(selectedColoumn: .queue),
                            label: {
                                Text("See all")
                            })
                        
                    }
                    .padding(.horizontal)
                    
                    
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
                Text("Triage Priority")
                    .font(.title2)
                    .bold()
                
                
                Spacer()
                
                NavigationLink(
                    destination: ListAllView(selectedColoumn: .all),
                    label: {
                        Text("See all")
                        
                    })
            }
            .padding(.horizontal)
        }
    }
}
