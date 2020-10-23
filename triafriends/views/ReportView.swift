//
//  ReportView.swift
//  swiftui1
//
//  Created by Abigail Aryaputra Sudarman on 20/10/20.
//

import SwiftUI

struct ReportView: View {
    var body: some View {
        
        ZStack{
            Image("gray")
                .cornerRadius(15)
                .scaleEffect(2)
                .contrast(-1)
                
        
        VStack{
        
            
            
            ZStack{
        
               
                
                Text("Hari Ini")
                    .font(.title2)
                    .bold()
                
    }
        	
        Spacer()
            
        Text("12 pasien")
        
        }
        .padding()
        .frame(width: 200.0, height: 132.0)
        
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()
    }
}
