//
//  FirebaseManager.swift
//  news
//
//  Created by Евгений Маглена on 27.12.2021.
//

import Foundation
import UIKit
import Firebase
import FirebaseFirestore

class FirebaseManager {
    
    static let shared = FirebaseManager()
    let db = Firestore.firestore()
    
    func createUserWith(_ data: [String: Any], completion: @escaping (_ error: Error?) -> Void) {
        guard let email = data["email"] as? String,
              let password = data["password"] as? String else { return }
        Auth.auth().createUser(withEmail: email, password: password) { authDataResult, error in
            completion(error)
            if authDataResult != nil {
                self.saveUserToFirestoreWith(data)
                self.saveOtherDataToFirestore(data)
            }else {
                print("nil")
            }
        }
    }
    private func saveUserToFirestoreWith(_ data: [String:Any] = [:]) {
        guard let id = Auth.auth().currentUser?.uid else {return}
        var copyData = data
        copyData["id"] = id
        copyData.removeValue(forKey: "password")
        Firestore.firestore().collection("newss").document(id).setData(copyData)
    }
    
    private func saveOtherDataToFirestore(_ data: [String:Any] = [:]) {
        var ref: DocumentReference? = nil
        guard let _ = data["name"],
              let _ = data["surname"],
              let _ = data["birthday"] else { return }
        ref = db.collection("newss").addDocument(data: data, completion: { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        })
    }
}
