//
//  OnboardingPage.swift
//  NewsApplication
//
//  Created by zehra on 19.09.2023.
//

import UIKit

class OnboardingPage: UIViewController {

    let viewModel = OnboardingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.presentOnboarding(root: self)

    }
}
