//
//  LoginView.swift
//  triafriends
//
//  Created by Arie May Wibowo on 24/10/20.
//
import SwiftUI
import CryptoKit
import FirebaseAuth
import AuthenticationServices
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
    @State var isAuthorized = false
    @ObservedObject var fbmanager = UserLoginManager()
    @Environment(\.presentationMode) var presentationMode
//    @State var coordinator : SignInWithAppleCoordinator?
    
    @AppStorage("logged") var logged = false
    @AppStorage("email") var email = ""
    @State var manager = LoginManager()
   static let instance = LoginCard()
    
    //Variable to keep track of nonce
    @State var currentNonce:String?
    
    //Hashing function requires Cryptokit
    func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
        return String(format: "%02x", $0)
        }.joined()

        return hashString
    }
    
    //Creates a random string of characters
    func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: Array<Character> =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length

        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
                }
                return random
            }

            randoms.forEach { random in
                if length == 0 {
                    return
                }

                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }

        return result
    }
    //testting
    var body: some View {
        if isAuthorized == true {
            SignMeUpView()
        }else{
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
                 
//
//                //Print current userID from Firebase
//                Button(action:{print("Current UserID: \(String(describing: Auth.auth().currentUser?.uid))")}){
//                    Text("Print Current User")
//                }.frame(width: UIScreen.main.bounds.width/1.5, height: 50, alignment: .center)
//
//                //Sign out of Firebase Button
//                Button(action:{print("Signed Out"); do{try Auth.auth().signOut()}catch{ print("Err")}}){
//                    Text("Sign Out")
//                }.frame(width: UIScreen.main.bounds.width/1.5, height: 50, alignment: .center)
                
                //Sign in with Apple button
                
                SignInWithAppleButton(
                    
                    //Request
                    onRequest: { request in
                        let nonce =  randomNonceString()
                        currentNonce = nonce
                        request.requestedScopes = [.fullName, .email]
                        request.nonce = sha256(nonce)
                    },
                    
                    //Completion
                    onCompletion: { result in
                        switch result {
                            case .success(let authResults):
                                switch authResults.credential {
                                    case let appleIDCredential as ASAuthorizationAppleIDCredential:
                                    
                                            guard let nonce = currentNonce else {
                                              fatalError("Invalid state: A login callback was received, but no login request was sent.")
                                            }
                                            guard let appleIDToken = appleIDCredential.identityToken else {
                                                fatalError("Invalid state: A login callback was received, but no login request was sent.")
                                            }
                                            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                                              print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                                              return
                                            }
                                            
                                            //Creating a request for firebase
                                            let credential = OAuthProvider.credential(withProviderID: "apple.com",idToken: idTokenString,rawNonce: nonce)
                                    
                                            //Sending Request to Firebase
                                            Auth.auth().signIn(with: credential) { (authResult, error) in
                                                if (error != nil) {
                                                    // Error. If error.code == .MissingOrInvalidNonce, make sure
                                                    // you're sending the SHA256-hashed nonce as a hex string with
                                                    // your request to Apple.
                                                    print(error?.localizedDescription as Any)
                                                    return
                                                }
                                                 
                                                // User is signed in to Firebase with Apple.
                                                print("you're in")
                                                isAuthorized = true
                                                let newUserInfo = Auth.auth().currentUser
                                                let emailaa = newUserInfo?.email
                                                let name = newUserInfo?.displayName
                                                let id = newUserInfo?.uid
//                                                self.loginView.isAuthorized = true
                                                email = emailaa  as! String
                                                print("Apple Sign In \(emailaa) \(name) \(id)")
                                            
                                            }
                                    
                                        //Prints the current userID for firebase
                                        print("\(String(describing: Auth.auth().currentUser?.uid))")
                                default:
                                    break
                                            
                                        }
                               default:
                                    break
                            }
                        
                    }).frame(width: UIScreen.main.bounds.width/1.5, height: 50, alignment: .center).clipShape(Capsule())
                FaceBookLoginView().frame(width: 180, height: 50,alignment: .center).padding(10)
                Button(action: {
                    if logged{
                        manager.logOut()
                        email = ""
                        logged = false
                    }else{
                        manager.logIn(permissions: ["public_profile","email"], from: nil) { (result,err) in
                            if err != nil {
                                print(err!.localizedDescription)
                                return
                            }
                           //checking if user cancelled the flow
                            if !result!.isCancelled{
                                //logged success...
                            
                                logged = true
                               
                                //getting user details using fb graph request
                                let request = GraphRequest(graphPath: "me",parameters: ["fields": "email"])
                              
                                request.start{ (_, res, _) in
                                    guard let profileDaata = res as? [String : Any] else {return }
                                   
                                    email = profileDaata["email"] as! String
                                    
                                    
                                }
                            }
                           

                        }
                    }
                },
                label: {
                    
                    Text(logged ? "LogOut" : "Sign Up with Facebook")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .padding(.vertical,13)
                        .padding(.horizontal,45)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .frame(width: UIScreen.main.bounds.width/1.5, height: 50, alignment: .center)
                })
                
//                Text(email).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
               
                 
            }.frame(width: screen.width, height: screen.height * 0.36, alignment: .center)
            
          
            
        }}
       
        
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
struct Code_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
