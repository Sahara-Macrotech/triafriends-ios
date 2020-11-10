//
//  CongratulationView.swift
//  triafriends
//
//  Created by Iswandi Saputra on 26/10/20.
//

import SwiftUI
let screen3 = UIScreen.main.bounds
struct CongratulationView: View {
    var body: some View {
        NavigationView {
        ZStack {
            VStack {
                Spacer()
                CardCongratulation()
            }
        }
        .frame(width: screen.width, height: screen.height, alignment: .center)
        .background(Color.init(red: 75/255, green: 39/255, blue: 102/255, opacity: 1))
        .ignoresSafeArea()
        }
    }
}
struct CardCongratulation: View {
    @State var GoToView2:Bool = false
    
    
    @State private var selectedStrength = 0
    @State private var backgroundColor = Color.red
    @State private var current: Int? = 0
    var body: some View {
//        if current == 0 {
//        if (GoToView2) {
//                        MainViewApp(GoToView1: self.$GoToView2)
//        }else{
        ZStack (alignment: .bottom) {
          
            Rectangle()
                .frame(width: screen.width, height: screen.height * 0.4, alignment: .center)
                .padding(.bottom, 0)
                .cornerRadius(25)
                .foregroundColor(Color.init(white: 1, opacity: 1))
            VStack (alignment: .leading){
                Text("Congratulation").font(.system(size: 25)).bold()
                    .padding(.bottom,25).frame(maxWidth: .infinity, alignment: .center).padding(.top,30)
                Text("Your data have been accepted by the hospital, now you can use the app.").font(.system(size: 20)).bold().fixedSize(horizontal: false, vertical: true).frame(maxWidth: .infinity, alignment: .center).opacity(0.5).multilineTextAlignment(.center).padding()
                NavigationLink(destination: MainViewApp(GoToView1: self.$GoToView2)){
                    ButtonView()
                }
                .background(Color.init(red: 75/255, green: 39/255, blue: 102/255, opacity: 1))
                   .cornerRadius(20)
                   .shadow(color: Color.init(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.06), radius: 8, x: 0, y: 4)
                   .frame(width: UIScreen.main.bounds.width-60, height: 60)
                   .padding(23)
               
//                Button(action: {
//                    withAnimation {
//                                             self.GoToView2.toggle()
//                                         }
//                }) {
//                    HStack {
//
//                        //                                       .accessibility(label: Text("Sign in with Google"))
//                        Spacer()
//                        Text("Go to Home").font(.title3)
//                            .foregroundColor(.white).bold()
//                        Spacer()
//                    }
//
//                    //                            .clipShape(Circle())
//                }  .padding()
//
//                .background(Color.init(red: 75/255, green: 39/255, blue: 102/255, opacity: 1))
//                .cornerRadius(20)
//                .shadow(color: Color.init(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.06), radius: 8, x: 0, y: 4)
//                .frame(width: UIScreen.main.bounds.width-60, height: 60)
//                .padding(23)
                
                
                
            } .frame(width: screen.width, height: screen.height * 0.4, alignment: .center)
            
            
            
            
        
//
//    }else{
//            MainViewApp()
//        }
        }
    }
}

struct CongratulationView_Previews: PreviewProvider {
    static var previews: some View {
        CongratulationView()
    }
}

struct ButtonView: View {
var body: some View {
    Text("Go To Home")
        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        .foregroundColor(.white)
        .padding(.vertical,20)
        .padding(.horizontal,95)
       
//        .background(Color.blue)
//        .clipShape(RoundedRectangle(cornerRadius: 25))
//        .frame(width: UIScreen.main.bounds.width/1.5, alignment: .center)
}
}
