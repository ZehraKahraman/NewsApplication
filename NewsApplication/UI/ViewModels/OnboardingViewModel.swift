//
//  OnboardingViewModel.swift
//  NewsApplication
//
//  Created by zehra on 19.09.2023.
//

import UIKit

class OnboardingViewModel {
    func presentOnboarding(root: UIViewController) {
        let storyboard = UIStoryboard(name: "SignIn", bundle: nil)
        let mainPage = storyboard.instantiateViewController(withIdentifier: "SignInPage") as! SignInPage
        mainPage.modalPresentationStyle = .fullScreen
        root.show(mainPage, sender: nil)
    }
}
