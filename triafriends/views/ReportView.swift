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
            colorLightGray
                .frame(width: 179, height: 131, alignment: .center)
                .cornerRadius(6)
           
                
        
        VStack{
        
            
            
            ZStack{
        
               
                
                Text("Today")
                    .font(.title2)
                    .bold()
                
    }
        	
        Spacer()
            
        Text("12 patient")
        
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
