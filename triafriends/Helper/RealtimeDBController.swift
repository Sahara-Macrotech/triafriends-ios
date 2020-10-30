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
    
    func updatePatientQueue(hospital: String, uid: String, denyutNadi: String, distress: String, gcs: Int, hemodinamik: String, hipoventilasi: String, jalanNafas: String, nadi: String, name: String, patientState: String, psikologis: String, respiratoryRate: String, status: Int, warnaKulit: String) -> Void {
        
        ref = Database.database().reference()

        let post = ["denyutNadi": denyutNadi,
                    "distress": distress,
                    "gcs": gcs,
                    "hemodinamik": hemodinamik,
                    "hipoventilasi": hipoventilasi,
                    "jalanNafas": jalanNafas,
                    "nadi": nadi,
                    "name": name,
                    "patientState": patientState,
                    "psikologis": psikologis,
                    "respiratoryRate": respiratoryRate,
                    "status": status,
                    "warnaKulit": warnaKulit
        ] as [String : Any]
        let childUpdates = ["patients/\(hospital)/\(uid))": post]
        ref.updateChildValues(childUpdates)
    }
    
    func changePatientState(uid: String, hospital: String, state: String) -> Void {
        ref = Database.database().reference()
        ref.root.child("patients").child(hospital).child("\(uid)").updateChildValues(["patientState": state])
    }
    
//    func deletePatientFromQueue(uid: String, hospital: String) -> Void {
//        ref = Database.database().referen ce()
//        let childToBeDeleted = ref.child("patients").child(hospital).child(uid)
//        childToBeDeleted.removeValue()
//    }
//
//    func deletePatientFromHandled(uid: String, hospital: String) -> Void {
//        ref = Database.database().reference()
//        let childToBeDeleted = ref.child(hospital).child("patients").child("handled").child(uid)
//        childToBeDeleted.removeValue()
//    }
//
//    func moveToHandled(uid: String, hospital: String) -> Void {
//        let group = DispatchGroup()
//        let moveRef = Database.database().reference()
//        DispatchQueue.global(qos: .userInitiated).async(group: group) {
//            print(uid)
//            moveRef.child(hospital).child("patients").child("queue").child(uid).observe(.childAdded, with: { (snapshot) in
//                moveRef.child(hospital).child("patients").child("handled").child(uid).child(snapshot.key).setValue(snapshot.value)
//            })
//           }
//
//        group.notify(queue: .main) {
//            self.deletePatientFromQueue(uid: uid, hospital: hospital)
//        }
//    }
//
//    func moveToDone(uid: String, hospital: String) -> Void {
//        let group = DispatchGroup()
//        let moveRef = Database.database().reference()
//        DispatchQueue.global(qos: .userInitiated).async(group: group) {
//            print(uid)
//            moveRef.child(hospital).child("patients").child("handled").child(uid).observe(.childAdded, with: { (snapshot) in
//                moveRef.child(hospital).child("patients").child("done").child(uid).child(snapshot.key).setValue(snapshot.value)
//            })
//           }
//
//        group.notify(queue: .main) {
//            self.deletePatientFromQueue(uid: uid, hospital: hospital)
//        }
//    }
}
