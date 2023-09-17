//
//  AuthRepository.swift
//  NewsApplication
//
//  Created by zehra on 17.09.2023.
//

import FirebaseAuth

class AuthRepository {
    func saveUser(email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            let success = error.isNil()
            completion(success)
        }
    }
    
    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            let success = error.isNil()
            completion(success)
        }
    }
}
