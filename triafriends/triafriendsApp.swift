//
//  triafriendsApp.swift
//  triafriends
//
//  Created by Arie May Wibowo on 22/10/20.
//

import SwiftUI

@main
struct triafriendsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
