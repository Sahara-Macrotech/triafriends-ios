//
//  MainViewApp.swift
//  triafriends
//
//  Created by Iswandi Saputra on 06/11/20.
//

import SwiftUI

struct MainViewApp: View {
    @State var isPopUpEnabled = false
    @State var selection = 0
    //Kalo defaultnya 1, ga error, kalo defaultnya 0 error
    var body: some View {
        
            ZStack{
                
             
                //Tab Bar
                
                TabView(selection: $selection) {
                    
                    NavigationView{
                        ContentView()}
                        .tabItem {
                        
                        selection == 1 ? Image(systemName: "house") : Image(systemName: "house.fill")
                           
                        Text("Dashboard")
                            .font(.custom(nameBold, size: 12))
                        
                    }.tag(0)
                    
                    NavigationView{
                    NewHistoryView()
                    }
                        .tabItem {
                            
                            selection == 0 ? Image(systemName: "clock") : Image(systemName: "clock.fill")
                            
                        Text("History")
                            .font(.custom(nameBold, size: 12))
                        
                        }.tag(1)
            
                }.accentColor(colorPurple)
                
                
                
                // Add Button overlay
                VStack{
                    Spacer(minLength: 730)
                    //Ganti minlength jadi UIScreen.main.bound / x
                    
                
                    Button(action: {}, label: {
                        ZStack{
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 72, height: 72, alignment: .center)
                            .accentColor(.white)
                            .shadow(radius: 3)

                        Image("add").onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
                            .scaleEffect(0.35)
                        }
                        .onTapGesture(count: 1, perform: {
                            isPopUpEnabled = true
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
                  
                    PatientNameInput()
                    
                    
                    

                }
            }
            
            
        
    }
}

//struct MainViewApp_Previews: PreviewProvider {
//    static var previews: some View {
//        MainViewApp()
//    }
//}
