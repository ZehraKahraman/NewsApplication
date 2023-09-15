//
//  SignUpPage.swift
//  NewsApplication
//
//  Created by varol on 10.09.2023.
//

import UIKit

class SignUpPage: UIViewController {

    @IBOutlet weak var signUpImage: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveButton(_ sender: Any) {
    }
}
