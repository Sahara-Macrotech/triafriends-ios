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
    
    
    func writeToDB(triages: Triage, hospitalID: String, completion: @escaping ((String) -> Void)){
        //HospitalID:uidx:"triage": denyutNadi:dn.rawvalue
        //add triage parameter in production
      
        var ref: DatabaseReference!
        
        ref = Database.database().reference(fromURL: "https://triafriends-1.firebaseio.com/patients/\(hospitalID)/")
        
        let id = UUID().uuidString
        
        //replace value with value from parameter
        var dict = ["id" : id, //this cause the problem? if yes create UUID instead!
                    
                    //status belum berdasarkan hasil triase
                    "createAt" : ServerValue.timestamp(),
                    "status" : triages.status as Any,
                    "patientState" : triages.status == 6 ? "Done" :  triages.patientState?.rawValue as Any,
                    "name" : triages.name as Any,
                    "jalanNafas" : triages.jalanNafas?.rawValue as Any,
                    "distress" : triages.distress?.rawValue as Any,
                    "respiratoryRate" : triages.respiratoryRate?.rawValue as Any,
                    "hentiNafas" : triages.hentiNafas?.rawValue as Any,
                    "hipoventilasi" : triages.hipoventilasi?.description as Any,
                    "hemodinamik" : triages.hemodinamik?.rawValue as Any,
                    "nadi" : triages.nadi?.rawValue as Any,
                    "denyutNadi" : triages.denyutNadi?.rawValue as Any,
                    "warnaKulit" : triages.warnaKulit?.rawValue as Any,
                    "gcs" : triages.gcs.rawValue,
                    "psikologis" : triages.psikologis?.rawValue as Any,
                    "startTime" : triages.startTime,
                    "endTime" : triages.endTime
                    
                    
        ] as [String : Any]
        
        ref.child(id).child("triage").setValue(dict)
        completion(id)

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
                    //print(dict)
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

