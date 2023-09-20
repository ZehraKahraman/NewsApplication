//
//  OnboardingPage.swift
//  NewsApplication
//
//  Created by zehra on 19.09.2023.
//

import UIKit

class OnboardingPage: UIViewController {

    
    @IBOutlet weak var skipButtonOutlet: UIButton!
    @IBOutlet weak var onboardingImage: UIImageView!
    
    let viewModel = OnboardingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        skipButtonOutlet.layer.cornerRadius = 10
                
    }
    
    @IBAction func skipButton(_ sender: Any) {
        viewModel.presentSignIn(root: self)
        
    }
    

}
