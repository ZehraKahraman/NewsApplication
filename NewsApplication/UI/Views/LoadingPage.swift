//
//  LoadingPage.swift
//  NewsApplication
//
//  Created by zehra on 19.09.2023.
//

import UIKit

class LoadingPage: UIViewController {
    private let viewModel = LoadingViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.onboarding(viewController: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.onboarding(viewController: self)

    }
}
