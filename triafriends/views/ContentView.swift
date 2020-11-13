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
    @State private var greeting = ""
    @State private var name: String = ""
    var body: some View {
      
        //DUMMY
        let hospitalID = "SILOAM2122"
        
        
        NavigationView{
            
            ZStack{
                VStack{
                    
                    VStack(spacing: 5){
                        
                        HStack{
                            Text(name.capitalized + ",")
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
                                    Image("doctor")
                                        
                                        .resizable()
                                        .clipShape(Circle())
                                        .scaledToFit()
                                        .frame(width: 72, height: 72, alignment: .center)
                                        
                                        
                                })
                            
                        }.padding(.horizontal)
                    }.position(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.minY)
                    
                    VStack{
                        
                        
                        
                        
                        Spacer()
                        VStack{
                            ExtractedView()
                            
                            
                            TriageListView(filteredQueue: .limitToFive)
                                .cornerRadius(0)
                                .frame(width: UIScreen.main.bounds.maxX , height: 340)
                                //this will disable the scrolling but disable the button also
                                .moveDisabled(true)
                            
                            //Title Laporan Harian and button
                            ExtractedView2()
                            
                        }
                        
                        
                        //Horizontal View Stack  laporan harian
                        HStack{
                            ReportView()
                                .scaleEffect(0.8)
                            Spacer()
                            ReportView()
                                .scaleEffect(0.8)
                        }
                        
                        
                    }
                    
                }
                
                
                
                
            }.padding(.bottom, 20)
            
            
        }.onAppear(perform: {
            helper.queryProfile(uid: dummyUID)
            greetingLogic()
        })
        .navigationTitle(Text(""))
        .navigationBarHidden(true)
        
        
        
    }
    
    
    
     func greetingLogic() {
           let date = NSDate()
           let calendar = NSCalendar.current
           let currentHour = calendar.component(.hour, from: date as Date)
           let hourInt = Int(currentHour.description)!

           if hourInt >= 12 && hourInt <= 16 {
               greeting = "Good Afternoon"
           }
           else if hourInt >= 7 && hourInt <= 12 {
               greeting = "Good Morning"
           }
           else if hourInt >= 16 && hourInt <= 20 {
               greeting = "Good Evening"
           }
           else if hourInt >= 20 && hourInt <= 24 {
               greeting = "Good Night"
           }
           else if hourInt >= 0 && hourInt <= 7 {
               greeting = "You should be sleeping right now"
           }
        name = greeting
//           helloLbl.text = greeting
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
    
    struct ExtractedView2: View {
        var body: some View {
            
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
        }
    }
}
