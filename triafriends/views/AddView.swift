//
//  Add.swift
//  swiftui1
//
//  Created by Abigail Aryaputra Sudarman on 20/10/20.
//

import SwiftUI

struct AddView: View {
    @State var namefield: String = " "
    
    var body: some View {
    ZStack{
        Color.white
            .ignoresSafeArea()
            .edgesIgnoringSafeArea(.all)
        VStack{
            
            
            //First input. Kayaknya jangan nama deh
            Text("Isi nama anda")
              
            //Field
            
            TextField("Dr. Sumanto", text: $namefield)
                .accentColor(.gray)
            
            Button(
                action: {print("buttonTapped")},
                label: {Text("Next")}
            )
            
            
            
        }
    }
    .cornerRadius(16)
        .padding()
    }
}

struct Add_Previews: PreviewProvider {
    static var previews: some View {
        AddView(namefield: " ")
    }
}
