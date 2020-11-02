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
        ref = Database.database().reference(fromURL: "https://triafriends-1.firebaseio.com/patients/\(hospitalID)")
        //bisa juga with path, bisa juga masukin parameter
        
        ref.child("uid").observe(.value) { (snapshot) in
            let postDict = snapshot.value as? NSDictionary
            
            let dN = postDict?["denyutNadi"] as? String
            print(dN)
        }
    }
    
    func addPatient(hospital: String, uid: String, denyutNadi: String, distress: String, gcs: Int, hemodinamik: String, hipoventilasi: String, jalanNafas: String, nadi: String, name: String, patientState: String, psikologis: String, respiratoryRate: String, status: Int, warnaKulit: String) -> Void {
        
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
    
    func getAllPatients(hospital: String, completion: @escaping ([String: Any]) -> Void) {
        let group = DispatchGroup()
        var data = [Any]()
        ref = Database.database().reference()
        group.enter()
        DispatchQueue.global(qos: .default).async(group: group) {
            self.ref.root.child("patients").child(hospital).observe(.value, with: {(snapshot) -> Void in
                var finalData = [[String: [String: Any]]]()
                for child in snapshot.children {
                    let snapShot = child as! DataSnapshot
                    let id = snapShot.key
                    var dataAwal = [String: Any]()
                    var dataTemporary = [String: Any]()
                    if let value = snapShot.value as? [String:Any] {
                        for (key, value) in value {
                            dataAwal = [
                                key: value
                            ]
                            dataTemporary += dataA
                        }
                        finalData.append([id: dataTemporary])
                    }
                    
                    
                }
                data = finalData
                group.leave()
            })
        }
        
        group.notify(queue: .main) {
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options:.allowFragments) as? [String:Any] {
                    print(json)
                }
            } catch let err{
                print(err.localizedDescription)
            }
        }
    }
    
    // Change state of patient for queue, handled, done
    func changePatientState(uid: String, hospital: String, state: String) -> Void {
        ref = Database.database().reference()
        ref.root.child("patients").child(hospital).child("\(uid)").updateChildValues(["patientState": state])
    }
    
    // Delete patient
    func deletePatient(uid: String, hospital: String) -> Void {
        ref = Database.database().reference()
        let childToBeDeleted = ref.child("patients").child(hospital).child(uid)
        childToBeDeleted.removeValue()
    }
    
    // To update specific data of patient
    func updatePatientData(uid: String, hospital: String, field: String, value: String) -> Void {
        ref = Database.database().reference()
        ref.root.child("patients").child(hospital).child("\(uid)").updateChildValues([field: value])
    }
    
    
}

struct parsePatientData {
    
    let denyutNadi: String
    let distress: String
    var gcs: Int
    let hemodinamik: String
    let hipoventilasi: String
    let jalanNafas: String
    let nadi: String
    let name: String
    let patientState: String
    let psikologis: String
    let respiratoryRate: String
    let status: Int
    let warnaKulit: String
    let ref: DatabaseReference
    
    
//    init(snapshot: DataSnapshot) {
//        //        denyutNadi = snapshot.
//    }
    
}
