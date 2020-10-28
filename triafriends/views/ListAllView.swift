//
//  ListAllView.swift
//  triafriends
//
//  Created by Abigail Aryaputra Sudarman on 28/10/20.
//

import SwiftUI


struct ListAllView: View {
    @State var selectedColoumn: Triage.PatientState
//0 = All
//1 = Queue
//2 = Handled
//3 = Done

//filter code

    //TODO: BIKIN INI DI DALEM VIEWMODEL
      
    var body: some View {
        VStack{
            //Sejenis Segmented Control
            HStack{
                Spacer()
                
                //TO DO : FIX ALL == .QUEUE
                Button(action: {
                    selectedColoumn = .queue
                }, label: {
                    Text("All")
                        .font(.custom(selectedColoumn == .queue ? nameBold : nameSemiBold, size: selectedColoumn == .queue ? 24 : 18))
                        .foregroundColor(selectedColoumn == .queue ? colorPurple : colorTextGray)
                    
                })
                Spacer()

                
                Button(action: {
                    selectedColoumn = .queue
                }, label: {
                    Text("Queue")
                        .font(.custom(selectedColoumn == .queue ? nameBold : nameSemiBold, size: selectedColoumn == .queue ? 24 : 18))
                        .foregroundColor(selectedColoumn == .queue ? colorPurple : colorTextGray)
                })
                Spacer()

                Button(action: {
                    selectedColoumn = .handled
                }, label: {
                    Text("Handled")
                        .font(.custom(selectedColoumn == .handled ? nameBold : nameSemiBold, size: selectedColoumn == .handled ? 24 : 18))
                        .foregroundColor(selectedColoumn == .handled ? colorPurple : colorTextGray)
                    
                })
                Spacer()

                Button(action: {
                    selectedColoumn = .done
                }, label: {
                    Text("Done")
                        .font(.custom(selectedColoumn == .done ? nameBold : nameSemiBold, size: selectedColoumn == .done ? 24 : 18))
                        .foregroundColor(selectedColoumn == .done ? colorPurple : colorTextGray)
                })
                Spacer()

            }
            
            
           
            
            
            
            
            TriageListView(filteredQueue: selectedColoumn)
                // <- ada  parameternya, mau filter apa
            //Filter queue view <- viewmodel
            //Filter handled view <- viewmodel
            //Filter done view <- viewmodel
                
                
                .scaleEffect(CGSize(width: 0.9, height: 0.9))
        
        }
    }
}

struct ListAllView_Previews: PreviewProvider {
    static var previews: some View {
        ListAllView(selectedColoumn: .done)
    }
}
