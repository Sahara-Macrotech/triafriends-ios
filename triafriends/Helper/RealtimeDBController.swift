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
    
    
    func writeToDB(hospitalID: String){
        //HospitalID:uidx:"triage": denyutNadi:dn.rawvalue
        //add triage parameter in production
      
        var ref: DatabaseReference!
        
        ref = Database.database().reference(fromURL: "https://triafriends-1.firebaseio.com/patients/\(hospitalID)/")
        
        
        //replace value with value from parameter
        var dict = ["id" : "1", //this cause the problem? if yes create UUID instead!
                    "status" : 5,
                    "patientState" : "Done",
                    "name" : "DARI FUNCTION",
                    "jalanNafas" : "Patent",
                    "distress" : "RR is normal",
                    "respiratoryRate" : "Can communicate well",
                    "hentiNafas" : "Stop breathing",
                    "hipoventilasi" : "true",
                    "hemodinamik" : "No hemodynamic disturbances",
                    "nadi" : "Pulse palpable",
                    "denyutNadi" : "Peripheral pulse is palpable",
                    "warnaKulit" : "Pale skin reddish warm acral",
                    "gcs" : 3,
                    "psikologis" : "Cooperative",
                    "startTime" : 1900,
                    "endTime" : 1920
                    
                    
        ] as [String : Any]
        
        ref.childByAutoId().child("triage").setValue(dict)

        
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    func updatePatientQueue(name: String, score: String, hospital: String) -> Void {
        
        ref = Database.database().reference()
        let uuid = UUID().uuidString
        
        let post = ["uid": uuid,
                    "name": name,
                    "score": score]
        let childUpdates = ["\(hospital)/patients/queue/\(uuid)": post]
        ref.updateChildValues(childUpdates)
        
    }
    
    func deletePatientFromQueue(uid: String, hospital: String) -> Void {
        ref = Database.database().reference()
        let childToBeDeleted = ref.child(hospital).child("patients").child("queue").child(uid)
        childToBeDeleted.removeValue()
    }
    
    func deletePatientFromHandled(uid: String, hospital: String) -> Void {
        ref = Database.database().reference()
        let childToBeDeleted = ref.child(hospital).child("patients").child("handled").child(uid)
        childToBeDeleted.removeValue()
    }
    
    func moveToHandled(uid: String, hospital: String) -> Void {
        let group = DispatchGroup()
        let moveRef = Database.database().reference()
        DispatchQueue.global(qos: .userInitiated).async(group: group) {
            print(uid)
            moveRef.child(hospital).child("patients").child("queue").child(uid).observe(.childAdded, with: { (snapshot) in
                moveRef.child(hospital).child("patients").child("handled").child(uid).child(snapshot.key).setValue(snapshot.value)
            })
        }
        
        group.notify(queue: .main) {
            self.deletePatientFromQueue(uid: uid, hospital: hospital)
        }
    }
    
    func moveToDone(uid: String, hospital: String) -> Void {
        let group = DispatchGroup()
        let moveRef = Database.database().reference()
        DispatchQueue.global(qos: .userInitiated).async(group: group) {
            print(uid)
            moveRef.child(hospital).child("patients").child("handled").child(uid).observe(.childAdded, with: { (snapshot) in
                moveRef.child(hospital).child("patients").child("done").child(uid).child(snapshot.key).setValue(snapshot.value)
            })
        }
        
        group.notify(queue: .main) {
            self.deletePatientFromQueue(uid: uid, hospital: hospital)
        }
    }
}
