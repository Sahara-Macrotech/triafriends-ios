//
//  triageRiw.swift
//  swiftui1
//
//  Created by Abigail Aryaputra Sudarman on 20/10/20.
//

import SwiftUI

struct TriageListView: View {
    var triageData = triages
    var body: some View {
       
        HStack{
            
            List(triages){triages in
                Text(triages.name)
                Spacer()
                
                Image("\(triages.status)")
                    .clipShape(Circle(), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
                    
                
            }
            .onAppear(){
            UITableView.appearance().backgroundColor = UIColor.clear
           
            }
        
        
        }
      
    }
}

struct triageList_Previews: PreviewProvider {
    static var previews: some View {
        TriageListView()
    }
}
