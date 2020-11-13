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
import Combine
import CryptoKit
import FirebaseAuth
import AuthenticationServices
let screen1 = UIScreen.main.bounds

struct SignMeUpView:  View {
    @AppStorage("email") var email = ""
  
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
    @ObservedObject var emailObj = EmailValidationObj()
       @ObservedObject var passObj = PasswordValidationObj()
    @AppStorage("email") var emailValid = ""
    @ObservedObject private var name = TextValidationObj()
    @State private var email: String = ""
    @ObservedObject private var id = TextValidationObj()
    @State private var job: String = "Doctor"
    @State private var hospital: String = "RS Wijaya Kusuma"
    var strengths = ["Mild", "Medium", "Mature"]
    @ObservedObject var hospitalData = getHospitalData()
    @State private var selectedHospital: String = UserDefaults.standard.string(forKey: "selectedHospital") ?? "Unknown Hospital"

    @State private var selectedStrength = 0
    @State private var backgroundColor = Color.red
    @State var showingDetail = false
    @State private var current: Int? = 0
    
    init() {
        print(emailValid)
        print(UserDefaults.standard.array(forKey: "credentials"))
    }
    
    
     
    var body: some View {
        if current == 0 {
        NavigationView {
//            VStack(spacing: 20) {
//                        VStack(alignment: .leading, spacing: 4) {
//                             TextField("Enter your Email", text: $emailObj.email).foregroundColor(.white)
//                             Text(emailObj.error).foregroundColor(.red).font(.caption)
//                        }
//
//                        VStack(alignment: .leading, spacing: 4) {
//                            TextField("Password", text: $passObj.pass).foregroundColor(.white)
//                            Text(passObj.error).foregroundColor(.red).font(.caption)
//                        }
//                    }
        ZStack (alignment: .bottom) {
//            Rectangle()
//                .frame(width: screen.width, height: screen.height * 0.9, alignment: .center)
//                .padding(.bottom, 0)
//                .cornerRadius(25)
//                .foregroundColor(Color.init(white: 1, opacity: 1))
            VStack (alignment: .leading){
                Text("Complete Your Data").font(.system(size: 25)).bold()
                    .padding(.bottom,35).frame(maxWidth: .infinity, alignment: .center)
                Group{
                    Text("Name").font(.system(size: 25)).bold()
                        .padding(.leading,15)
                    TextField("Enter your name", text: $name.email)
                        .font(.title2).opacity(0.5)
                        .padding(.leading,15)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text(name.error).foregroundColor(.red).font(.caption)
                    Text("Email")
                        
                        .font(.system(size: 25)).bold()
                        .padding(.leading,15)
                    VStack(alignment: .leading, spacing: 4) {
                         TextField("Enter your Email", text: $emailValid)  .font(.title2).opacity(0.5)
                            .padding(.leading,15)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                         Text(emailObj.error).foregroundColor(.red).font(.caption)
                    }
//                    TextField("Enter your Email", text:$emailValid)
                      
                
                    VStack(alignment: .leading) {
                        Text("ID")
                            
                            .font(.system(size: 25)).bold()
                            .padding(.leading,15)
                        TextField("Input ID number from hospital", text: $id.email)
                            .font(.title2).opacity(0.5)
                            .padding(.leading,15)
    //                        .keyboardType(.phonePad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Text(id.error).foregroundColor(.red).font(.caption)
                        Text("Job")
                            
                            .font(.system(size: 25)).bold()
                            .padding(.leading,15)
                        
                        TextField("Enter your job", text: $job)
                            .font(.title2).opacity(0.5)
                            .padding(.leading,15)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                               Form {
                                   Section {
                                       Picker(selection: $selectedHospital, label: Text("Hospital Name")) {
                                           ForEach(hospitalData.datas, id: \.id) {
                                               Text($0.name)
                                           }
                                       }
                                       .onReceive(Just(selectedHospital)) {
                                           UserDefaults.standard.set($0, forKey: "selectedHospital")
                                       }
                                    Text("Selected Hospital: \(selectedHospital)")
                                   }
                               }
                           }
                    
//                    Text("Hospital").font(.system(size: 25)).bold()
//                        .padding(.leading,15)
//
//                    TextField("Enter your Hospital", text: $hospital)
//                        .font(.title2).opacity(0.5)
//                        .padding(.leading,15)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                let uuidd =   Auth.auth().currentUser?.uid
               
                Button(action: {
                        Print("test:"+selectedHospital)
                        if id.email != "" && name.email != "" && selectedHospital != "Unknown Hospital"{
                    self.current = 1
                    let ratingDictionary = [
                        "uuid":uuidd,
                        "name":self.name.email,
                        "email":self.emailValid,
                        "phone":self.id.email,
                        "job":self.job,
                        "hospital":self.selectedHospital
                        
                    ]
                    
                    
                    let docRef = Firestore.firestore().document("user/\(UUID().uuidString)")
                    print("setting data")
                    docRef.setData(ratingDictionary, merge: true){ (error) in
                        if let error = error {
                            print("error = \(error)")
                        } else {
                            print("data updated successfully")
                            UserDefaults.standard.setValue(ratingDictionary, forKey: "credentials")
//                            self.showSheet = false
                            self.name.email = ""
                            self.email = ""
                            self.id.email = ""
                            self.job = ""
                            self.hospital = ""
                        }
                    }
                    
                    print(UserDefaults.standard.dictionary(forKey: "credentials"))
                    
                    print("prit")
                    }else{
                        
                    }}
                    ) {
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
        
        }}else{
            ThankYouView()
        }
}
}


struct SignMeUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignMeUpView()
    }
}


