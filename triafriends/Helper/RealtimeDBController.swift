//
//  RealtimeDBController.swift
//  triafriends
//
//  Created by Arie May Wibowo on 28/10/20.
//

import SwiftUI
import Firebase
import FirebaseDatabase

class RealtimeDBController {
    
    var ref: DatabaseReference!
    
   
    
    
    func queryProfile(uid: String){
        ref = Database.database().reference(fromURL: "https://triafriends-1.firebaseio.com/users/\(uid)/")
        
        ref.observe(.value) { (snapshot) in
            
            let dict = snapshot.value as! [String : Any]
           
            
        
            //return
            let userRole = dict["role"]
            let userName = dict["name"]
            let userHospital = dict["hospital"]
            let userPhoneNumber = dict["phoneNumber"]
            let userEmail = dict["email"]
            
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
