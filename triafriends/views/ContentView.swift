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

            Button(action: {
                NavigationLink(destination:LoginView() ) {
                }
            }) {
                HStack {
                    Spacer()
                    Text("Login").foregroundColor(Color.white).bold()
                    Spacer()
                }
            }
            .accentColor(Color.black)
            .padding()
            .background(Color(UIColor.darkGray))
            .cornerRadius(4.0)
            .padding(Edge.Set.vertical, 20)
        }
    
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
