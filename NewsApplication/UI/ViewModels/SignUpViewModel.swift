//
//  SignUpViewModel.swift
//  NewsApplication
//
//  Created by zehra on 17.09.2023.
//

class SignUpViewModel {
    let authRepository = AuthRepository()
    
    func saveUser(email: String, password: String) {
        authRepository.saveUser(email: email, password: password) { success in
            print(success)
        }
    }
}
