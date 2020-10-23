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
            TabView {
            ContentView().tabItem {
                Image(systemName: "list.dash")
                Text("Dashboard")
                    
             }
                
                AddView(namefield: "Dr. sumanto").tabItem { Image(systemName: "plus.rectangle.fill")
                    Text("Add")
                }
            AccountView().tabItem { Image(systemName: "list.dash")
                Text("Account") }
            
            }
            
        }
    }
}

struct Triafriends_previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
