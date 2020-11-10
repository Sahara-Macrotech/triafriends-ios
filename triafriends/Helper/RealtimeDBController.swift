//
//  RealtimeDBController.swift
//  triafriends
//
//  Created by Arie May Wibowo on 28/10/20.
//
import SwiftUI
import Firebase
import FirebaseDatabase
import FirebaseFirestore

class RealtimeDBController {
    
    var ref: DatabaseReference!
    
    
    func writeToDB(triages: Triage, hospitalID: String, completionId: @escaping ((String) -> Void)){
        //HospitalID:uidx:"triage": denyutNadi:dn.rawvalue
        //add triage parameter in production
      
        var ref: DatabaseReference!
        let id = UUID().uuidString
        
        ref = Database.database().reference(fromURL: "https://triafriends-1.firebaseio.com/patients/\(hospitalID)/")
        
        //replace value with value from parameter
        let dict = ["id" : id, //this cause the problem? if yes create UUID instead!
                    
                    //status belum berdasarkan hasil triase
                    "createAt" : 1604628129,
                    "status" : triages.status,
                    "patientState" : triages.patientState?.rawValue,
                    "name" : triages.name,
                    "jalanNafas" : triages.jalanNafas?.rawValue,
                    "distress" : triages.distress?.rawValue,
                    "respiratoryRate" : triages.respiratoryRate?.rawValue,
                    "hentiNafas" : triages.hentiNafas?.rawValue,
                    "hipoventilasi" : triages.hipoventilasi?.description,
                    "hemodinamik" : triages.hemodinamik?.rawValue,
                    "nadi" : triages.nadi?.rawValue,
                    "denyutNadi" : triages.denyutNadi?.rawValue,
                    "warnaKulit" : triages.warnaKulit?.rawValue,
                    "gcs" : triages.gcs.rawValue,
                    "psikologis" : triages.psikologis?.rawValue,
                    "startTime" : 1900,
                    "endTime" : 1920
                    
                    
        ] as [String : Any]
        
        ref.child(id).child("triage").setValue(dict)
        completionId(id)

    }
    
    func changePatientState(hospitalID: String, id: String, state: String) -> Void {
        var ref: DatabaseReference!
        
        ref = Database.database().reference(fromURL: "https://triafriends-1.firebaseio.com/patients/\(hospitalID)/\(id)/triage")
        ref.updateChildValues(["patientState": state])
    }
    
    func queryProfile(uid: String){
        
        let db = Firestore.firestore()
        let ref = db.collection("user").limit(to: 1)
        
        let query = ref.whereField("uuid", isEqualTo: uid)
        query.getDocuments { (snapshot, error) in
            
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in snapshot!.documents {
                    //                          print("\(document.documentID) => \(document.data())")
                    let dict = document.data() as [String:Any]
                    print(dict)
                    let userRole = dict["job"]
                    let userName = dict["name"]
                    let userHospital = dict["hospital"]
                    let userPhoneNumber = dict["phone"]
                    let userEmail = dict["email"]
                    
                    
                    //SAVE TO USERDEFAULT
                    UserDefaults.standard.set(userName, forKey: "name")
                    UserDefaults.standard.set(userRole, forKey: "role")
                    UserDefaults.standard.set(userHospital, forKey: "hospital")
                    UserDefaults.standard.set(userEmail, forKey: "email")
                    UserDefaults.standard.set(userPhoneNumber, forKey: "phone")
                    
                }
            }
            
            
            
        }
    }
}

