//
//  LoginView.swift
//  triafriends
//
//  Created by Arie May Wibowo on 24/10/20.
//

import SwiftUI
import Foundation
import FBSDKLoginKit

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
    @ObservedObject var fbmanager = UserLoginManager()
    
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
                Text("Sign In").font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.bottom,30)
                 
                SignInWithApple()
                    .frame(width: 280, height: 60).cornerRadius(20).padding(.bottom,10)
                
                Button(action: {
                            self.fbmanager.facebookLogin()
                        }) {
                    HStack {
                                    
//                                       .accessibility(label: Text("Sign in with Google"))
                                   Spacer()
                        Text("Sign in with Facebook").font(.title3)
                                       .foregroundColor(.white).bold()
                                   Spacer()
                               }
                                
    //                            .clipShape(Circle())
                }  .padding()
               
                .background(Color.blue)
                .cornerRadius(20)
                .shadow(color: Color.init(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.06), radius: 8, x: 0, y: 4)
                .frame(width: 280, height: 60)
                 
            }.frame(width: screen.width, height: screen.height * 0.30, alignment: .center)
            
          
            
        }
        
    }
}
class UserLoginManager: ObservableObject {
    let loginManager = LoginManager()
    func facebookLogin() {
        loginManager.logIn(permissions: [.publicProfile, .email], viewController: nil) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Logged in! \(grantedPermissions) \(declinedPermissions) \(accessToken)")
                GraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name"]).start(completionHandler: { (connection, result, error) -> Void in
                    if (error == nil){
                        let fbDetails = result as! NSDictionary
                        print(fbDetails)
                    }
                })
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
