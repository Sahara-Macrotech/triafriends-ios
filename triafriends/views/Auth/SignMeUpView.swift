//
//  SignMeUpView.swift
//  triafriends
//
//  Created by Arie May Wibowo on 24/10/20.
//

import SwiftUI
import Foundation
import Firebase
import FirebaseFirestore

import CryptoKit
import FirebaseAuth
import AuthenticationServices
let screen1 = UIScreen.main.bounds

struct SignMeUpView:  View {
  
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                SignMeUpCard()
            }
        }
        .frame(width: screen.width, height: screen.height, alignment: .center)
        .background(Color.init(red: 75/255, green: 39/255, blue: 102/255, opacity: 1))
        .ignoresSafeArea()
        
    }
}

struct SignMeUpCard: View {
    @AppStorage("email") var emailValid = ""
    @State private var name: String = "Genki Wijoyo"
    @State private var email: String = "genkiwijoyo@gmail.com"
    @State private var phone: String = "082114260502"
    @State private var job: String = "Doctor"
    @State private var hospital: String = "RS Wijaya Kusuma"
    var strengths = ["Mild", "Medium", "Mature"]
    
    @State private var selectedStrength = 0
    @State private var backgroundColor = Color.red
    @State var showingDetail = false
    var body: some View {
        NavigationView {
        ZStack (alignment: .bottom) {
            Rectangle()
                .frame(width: screen.width, height: screen.height * 0.9, alignment: .center)
                .padding(.bottom, 0)
                .cornerRadius(25)
                .foregroundColor(Color.init(white: 1, opacity: 1))
            VStack (alignment: .leading){
                Text("Complete Your Data").font(.system(size: 25)).bold()
                    .padding(.bottom,35).frame(maxWidth: .infinity, alignment: .center)
                Group{
                    Text("Name").font(.system(size: 25)).bold()
                        .padding(.leading,15)
                    TextField("Enter your name", text: $name)
                        .font(.title2).opacity(0.5)
                        .padding(.leading,15)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("Email")
                        
                        .font(.system(size: 25)).bold()
                        .padding(.leading,15)
                    TextField("Enter your Email", text:$emailValid)
                        .font(.title2).opacity(0.5)
                        .padding(.leading,15)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("Phone")
                        
                        .font(.system(size: 25)).bold()
                        .padding(.leading,15)
                    TextField("Enter your phone", text: $phone)
                        .font(.title2).opacity(0.5)
                        .padding(.leading,15)
                        .keyboardType(.phonePad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("Job")
                        
                        .font(.system(size: 25)).bold()
                        .padding(.leading,15)
                    
                    TextField("Enter your job", text: $job)
                        .font(.title2).opacity(0.5)
                        .padding(.leading,15)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("Hospital").font(.system(size: 25)).bold()
                        .padding(.leading,15)
                    
                    TextField("Enter your Hospital", text: $hospital)
                        .font(.title2).opacity(0.5)
                        .padding(.leading,15)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                let uuidd =   Auth.auth().currentUser?.uid
                Button(action: {
                    self.showingDetail.toggle()
                    let ratingDictionary = [
                        "uuid":uuidd,
                        "name":self.name,
                        "email":self.emailValid,
                        "phone":self.phone,
                        "job":self.job,
                        "hospital":self.hospital
                        
                    ]
                    
                    let docRef = Firestore.firestore().document("user/\(UUID().uuidString)")
                    print("setting data")
                    docRef.setData(ratingDictionary, merge: true){ (error) in
                        if let error = error {
                            print("error = \(error)")
                        } else {
                            
                            print("data updated successfully")
//                            self.showSheet = false
                            self.name = ""
                            self.email = ""
                            self.phone = ""
                            self.job = ""
                            self.hospital = ""
                        }
                    }
                    
                    print("")
                }) {
                    HStack {
                        
                        //                                       .accessibility(label: Text("Sign in with Google"))
                        Spacer()
                        Text("Sign me up").font(.title3)
                            .foregroundColor(.white).bold()
                        Spacer()
                    }
                    
                    //                            .clipShape(Circle())
                }
                .sheet(isPresented: $showingDetail) {
                    ThankYouView()
                }
                .padding()
                
                .background(Color.init(red: 75/255, green: 39/255, blue: 102/255, opacity: 1))
                .cornerRadius(20)
                .shadow(color: Color.init(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.06), radius: 8, x: 0, y: 4)
                .frame(width: UIScreen.main.bounds.width-60, height: 60)
                .padding(23)
                
                
                
            } .frame(width: 400, height: 700, alignment: .topLeading)
            
            
            
        }
        }
    }
}


struct SignMeUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignMeUpView()
    }
}
