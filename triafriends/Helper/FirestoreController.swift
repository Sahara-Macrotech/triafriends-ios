//
//  FirestoreController.swift
//  triafriends
//
//  Created by Arie May Wibowo on 27/10/20.
//

import SwiftUI
import Firebase

class FirestoreController {
    
    init() {
        FirebaseApp.configure()
    }
    
    func storeDoctor(name: String, hospital: String, status: Int) {
        let db = Firestore.firestore()
        // Add a new document with a generated ID
        db.collection("hospital").document(hospital).collection("doctors").addDocument(data:[
            "name": name,
            "hospital": status
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("\(name) added successfully")
            }
        }
    }
    
    func getDoctors(hospital: String, completion: @escaping (([Any]) -> Any)) {
        let db = Firestore.firestore()
        let group = DispatchGroup()
        var result:[Any] = []
        group.enter()
        DispatchQueue.global(qos: .userInteractive).async(group: group) {
        db.collection("hospital").document(hospital).collection("doctors").getDocuments
        { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                        result.append(document.data())
                    }
                }
            group.leave()
            }
        }
        group.notify(queue: .main) {
            completion(result)
        }
    }
    
    func getHospital() -> [String: Any] {
        let db = Firestore.firestore()
        var result: [String: Any] = [:]
        db.collection("hospital").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    result = document.data()
                }
            }
        }
        return result
    }
}
