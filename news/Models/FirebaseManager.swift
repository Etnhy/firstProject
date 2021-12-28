//
//  FirebaseManager.swift
//  ProjectNews
//
//  Created by Евгений Маглена on 23.12.2021.
//

import Foundation
import Firebase
import UIKit

class FirebaseManager {
    
    static let shared = FirebaseManager()
    
    let db = Firestore.firestore()
    
    func createUserWith(_ data: [String: Any], completion: @escaping (_ error: Error?) -> Void) {
        guard let email = data["email"] as? String,
              let password = data["password"] as? String else {
            //completion(AppError(message: "Error"))
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { authDataResult, error in
            completion(error)
            if authDataResult != nil {
                self.saveUserToFirestoreWith(data)
            }
        }
        
    }
    
    private func saveUserToFirestoreWith(_ data: [String:Any] = [:]) {
        
        guard let id = Auth.auth().currentUser?.uid else {return}
        var copyData = data
        //var other =
        
        copyData["id"] = id
        copyData.removeValue(forKey: "password")
        copyData["birthday"] = "21.11.1996"
        Firestore.firestore().collection("ProjectNews_Users").document(id).setData(copyData)
        
        
        
    }

    private func saveOtherDataToFirestore(_ otherdata: [String:Any] = [:]) {
        var ref: DocumentReference? = nil
        var other = otherdata
        
        guard let name = other["name"] as? String,
              let lastname = other["surname"] as? String,
              let birthdays = other["birthday"] as? String else { return }
        
        ref = db.collection("ProjectNews_UserStorage").addDocument(data: other, completion: { error in
            if let error = error {
                print("Error adding document: \(error)")

            } else {
                print("Document added with ID: \(ref!.documentID)")

            }
        })
    }
    
}
