//
//  Add.swift
//  swiftui1
//
//  Created by Abigail Aryaputra Sudarman on 20/10/20.
//

import SwiftUI

struct AddView: View {
    @State var namefield: String
    var body: some View {
        
        VStack{
            Text("Isi nama anda")
            TextField("Dr. Sumanto", text: $namefield)
            Button(action: {
                print("buttonTapped")
                //Set name value
                
            }, label: {
                Text("Next")
            })
            
        }
        .padding()
    }
}

struct Add_Previews: PreviewProvider {
    static var previews: some View {
        AddView(namefield: "Ceritanyastring")
    }
}
