//
//  ProfileViewModel.swift
//  NewsApplication
//
//  Created by zehra on 10.09.2023.
//

import Foundation
import FirebaseAuth
import RxSwift

class ProfileViewModel {
    var authRepository = AuthRepository()
    
    func getCurrentUser() -> User? {
        authRepository.getCurrentUser()
    }
}
