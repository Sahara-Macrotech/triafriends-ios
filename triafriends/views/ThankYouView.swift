//
//  ThankYouView.swift
//  triafriends
//
//  Created by Iswandi Saputra on 26/10/20.
//

import SwiftUI

let screen2 = UIScreen.main.bounds

struct ThankYouView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Card()
            }
        }
        .frame(width: screen.width, height: screen.height, alignment: .center)
        .background(Color.init(red: 75/255, green: 39/255, blue: 102/255, opacity: 1))
        .ignoresSafeArea()
    }
}

struct Card: View {
    
    
    
    @State private var selectedStrength = 0
    @State private var backgroundColor = Color.red
    var body: some View {
        ZStack (alignment: .bottom) {
            Rectangle()
                .frame(width: screen.width, height: screen.height * 0.4, alignment: .center)
                .padding(.bottom, 0)
                .cornerRadius(25)
                .foregroundColor(Color.init(white: 1, opacity: 1))
            VStack (alignment: .leading){
                Text("Thank You").font(.system(size: 25)).bold()
                    .padding(.bottom,25).frame(maxWidth: .infinity, alignment: .center).padding(.top,30)
                Text("Your data have been recorded. The hospital will review your data first before you can use the app.").font(.system(size: 20)).bold().fixedSize(horizontal: false, vertical: true).frame(maxWidth: .infinity, alignment: .center).opacity(0.5).multilineTextAlignment(.center).padding()
                
                Button(action: {
                    print("")
                }) {
                    HStack {
                        
                        //                                       .accessibility(label: Text("Sign in with Google"))
                        Spacer()
                        Text("OK").font(.title3)
                            .foregroundColor(.white).bold()
                        Spacer()
                    }
                    
                    //                            .clipShape(Circle())
                }  .padding()
                
                .background(Color.init(red: 75/255, green: 39/255, blue: 102/255, opacity: 1))
                .cornerRadius(20)
                .shadow(color: Color.init(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.06), radius: 8, x: 0, y: 4)
                .frame(width: UIScreen.main.bounds.width-60, height: 60)
                .padding(23)
                
                
                
            } .frame(width: screen.width, height: screen.height * 0.4, alignment: .center)
            
            
            
            
        }
        
    }
}

struct ThankYouView_Previews: PreviewProvider {
    static var previews: some View {
        ThankYouView()
    }
}
