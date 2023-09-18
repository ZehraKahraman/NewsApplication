//
//  ProfilePage.swift
//  NewsApplication
//
//  Created by zehra on 10.09.2023.
//

import UIKit

class ProfilePage: UIViewController {

    @IBOutlet weak var profilePageImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    private var viewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.layer.cornerRadius = 10
        surnameLabel.layer.cornerRadius = 10
        nameLabel.layer.cornerRadius = 10
        emailLabel.layer.cornerRadius = 10
        phoneNumberLabel.layer.cornerRadius = 10
        setContent()
    }
    
    func setContent() {
        guard let user = viewModel.getCurrentUser() else { return }
        emailLabel.text = user.email
    }
}
