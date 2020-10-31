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
    
   
    
    
    
/////QUERYNYA
    func query(hospitalID: String){
        
        
        //ini url cuma buat ngetest, untuk json 1 profile
        ref = Database.database().reference(fromURL: "https://triafriends-1.firebaseio.com/patients/\(hospitalID)/")
        //bisa juga with path, bisa juga masukin parameter
        
        ref.observe(.value) { (snapshot) in
            
           
//            let postDict = snapshot.value as? Data
            let all = snapshot.value
            
            do{
                let data = try? JSONSerialization.data(withJSONObject: all!, options: .sortedKeys)
                let decodedTriages = try? JSONDecoder().decode(rootReceivedTriage.self, from: data!)
                print(snapshot.value)
                
                //just a triage, not translated and not an array of triage
                
                
            }
            
            
           
            
            
            
//            let dN = postDict?["denyutNadi"] as? String
//            print(dN)
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
