//
//  triafriendsApp.swift
//  triafriends
//
//  Created by Arie May Wibowo on 22/10/20.
//

import SwiftUI
import Firebase
import GoogleSignIn
import FBSDKCoreKit

@main
struct triafriendsApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
   
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .onOpenURL(perform: { url in
                    ApplicationDelegate.shared.application(UIApplication.shared, open: url, sourceApplication: nil, annotation: UIApplication.OpenURLOptionsKey.annotation)
                })
        }
    }
}
////creating appdelegate
class AppDelegate:NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
       print("setting up firebase")
        FirebaseApp.configure()
        return true
    }
}
