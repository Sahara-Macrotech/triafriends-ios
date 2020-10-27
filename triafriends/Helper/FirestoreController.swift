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
    
    func storeDoctor(name: String, hospital: String) {
        
        let db = Firestore.firestore()
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db.collection("doctors").addDocument(data: [
            "name": name,
            "hospital": hospital
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    func getDoctors(hospital: String) {
        let db = Firestore.firestore()
        db.collection("doctors").whereField("hospital", isEqualTo: hospital).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
    }
}
