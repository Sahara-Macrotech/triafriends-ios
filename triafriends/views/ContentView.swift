//
//  ContentView.swift
//  triafriends
//
//  Created by Arie May Wibowo on 22/10/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body: some View {
       Text("TEST")
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
