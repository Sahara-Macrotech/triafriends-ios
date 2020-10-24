//
//  LoginView.swift
//  triafriends
//
//  Created by Arie May Wibowo on 24/10/20.
//

import SwiftUI

let screen = UIScreen.main.bounds

struct LoginView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                LoginCard()
            }
        }
        .frame(width: screen.width, height: screen.height, alignment: .center)
        .background(Color.init(red: 75/255, green: 39/255, blue: 102/255, opacity: 1))
        .ignoresSafeArea()
        
    }
}

struct LoginCard: View {
    var body: some View {
        ZStack (alignment: .bottom) {
            Rectangle()
                .frame(width: screen.width, height: screen.height * 0.3, alignment: .center)
                .padding(.bottom, 0)
                .cornerRadius(25)
                .foregroundColor(Color.init(white: 1, opacity: 1))
            Rectangle()
                .frame(width: screen.width, height: screen.height * 0.33, alignment: .center)
                .padding(.bottom, 0)
                .cornerRadius(25)
                .foregroundColor(Color.init(white: 1, opacity: 0.75))
            Rectangle()
                .frame(width: screen.width, height: screen.height * 0.36, alignment: .center)
                .padding(.bottom, 0)
                .cornerRadius(25)
                .foregroundColor(Color.init(white: 1, opacity: 0.5))
            VStack (alignment: .center){
                Text("Sign Up").font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                SignInWithApple()
                    .frame(width: 280, height: 60)
                Spacer()
            }.frame(width: screen.width, height: screen.height * 0.25, alignment: .center)
            
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
