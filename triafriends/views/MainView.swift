//
//  swiftui1App.swift
//  swiftui1
//
//  Created by Abigail Aryaputra Sudarman on 19/10/20.
//

import SwiftUI

@main
struct MainView: App {
    @State var isPopUpEnabled = false
    let firestore = FirestoreController()
    let realtimeDb = RealtimeDBController()
    
    var body: some Scene {
        WindowGroup {
            ZStack{
                
             
                //Tab Bar
                TabView {
                    
                    ContentView().tabItem {
                        Image(systemName: "list.dash")
                        Text("Dashboard")
                        
                    }
                    
                    
                    AccountView().tabItem {
                        Image(systemName: "list.dash")
                        Text("Account")
                        
                    }
            
                }.accentColor(colorPurple)
                
                
                
                // Add Button overlay
                VStack{
                    Spacer(minLength: 730)
                    //Ganti minlength jadi UIScreen.main.bound / x
                    
                
                    Button(action: {}, label: {
                        ZStack{
                        Image(systemName: "circle.fill")
                            .scaleEffect(CGSize(width: 4, height: 4))
                            .accentColor(.white)
                            .shadow(radius: 3)

                        Image("add")
                            .scaleEffect(0.35)
                        }.onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                            realtimeDb.changePatientState(uid: "uid", hospital: "SILOAM2122", state: "handled")
//                            isPopUpEnabled = true
                        })
                    })
                    Spacer()
                    
                    
                }
                
                //If AddButton is Pressed
                if isPopUpEnabled == true {
                    Color.black.opacity(0.5)
                        .ignoresSafeArea()
                        .animation(.easeIn)
                    //Initiate AddView here
                  AddView()
                    
                    

                }
            }
            
            
        }
    }
}

struct Triafriends_previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
