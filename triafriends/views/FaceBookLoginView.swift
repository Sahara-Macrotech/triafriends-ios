//
//  FaceBookLoginView.swift
//  FireBase_Authentication_Tutorial
//
//  Created by YOUNGSIC KIM on 2020-01-27.
//  Copyright © 2020 YOUNGSIC KIM. All rights reserved.
//

import SwiftUI
import FBSDKLoginKit
import Firebase

struct FaceBookLoginView: UIViewRepresentable {
    
    func makeCoordinator() -> FaceBookLoginView.Coordinator {
        return FaceBookLoginView.Coordinator()
    }
    
    class Coordinator: NSObject, LoginButtonDelegate {
        func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
            Auth.auth().signIn(with: credential) { (authResult, error) in
                
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                if let error = error as? NSError {
                    switch AuthErrorCode(rawValue: error.code) {
                    case .operationNotAllowed: break
                    // Error: The given sign-in provider is disabled for this Firebase project. Enable it in the Firebase console, under the sign-in method tab of the Auth section.
                    case .emailAlreadyInUse: break
                    // Error: The email address is already in use by another account.
                    case .invalidEmail: break
                    // Error: The email address is badly formatted.
                    case .weakPassword: break
                    // Error: The password must be 6 characters long or more.
                    default:
                        print("Error: \(error.localizedDescription)")
                    }
                } else {
                    print("User signs up successfully")
                    let newUserInfo = Auth.auth().currentUser
                    let email = newUserInfo?.email
                    
                    print("Facebook Sign In")
                   SignMeUpView()
                }
                
            }
        }
        
        func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
            try! Auth.auth().signOut()
        }
    }
    
    func makeUIView(context: UIViewRepresentableContext<FaceBookLoginView>) -> FBLoginButton {
        let view = FBLoginButton()
        view.permissions = ["email"]
        view.delegate = context.coordinator
        
        return view
    }
    
    func updateUIView(_ uiView: FBLoginButton, context: UIViewRepresentableContext<FaceBookLoginView>) {
        
    }
}
