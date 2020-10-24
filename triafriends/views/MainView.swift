//
//  swiftui1App.swift
//  swiftui1
//
//  Created by Abigail Aryaputra Sudarman on 19/10/20.
//

import SwiftUI

@main
struct MainView: App {
    var body: some Scene {
        WindowGroup {
            ZStack{
                
                TabView {
                    
                    ContentView().tabItem {
                        Image(systemName: "list.dash")
                        Text("Dashboard")
                        
                    }
            
                    AccountView().tabItem { Image(systemName: "list.dash")
                        Text("Account")  }
                    
                    
                }.accentColor(.purple)
                
                
                VStack{
                    Spacer(minLength: 760)
                    //Ganti minlength jadi UIScreen.main.bound / x
                    
                
                    
                    //--------
                    NavigationLink(
                        destination: AddView(namefield: " "),
                        label: {
                            Image(systemName: "circle.fill")
                                .scaleEffect(CGSize(width: 4, height: 4))
                                .accentColor(.white)
                                .shadow(radius: 3)
                        })
                    //Does not work, Button juga gabisa..
                    //Try to insert into each View
                    //---------
                    
                    Spacer()
                    
                    
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
