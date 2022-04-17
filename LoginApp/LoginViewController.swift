//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Вячеслав Кусакин on 16.04.2022.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var unTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    let username = "User"
    let password = "12345"

    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.layer.cornerRadius = 15

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showOutput" else { return }
        guard let outputVC = segue.destination as? OutputViewController else { return }
        outputVC.welcomeText = unTextField.text
    }

    @IBAction func loginButtonPressed() {
    }


    @IBAction func forgotUsernamePressed() {
        showAlert(title: "Correct username", message: username)
    }
    
    
    @IBAction func forgotPasswordPressed() {
        showAlert(title: "Correct password", message: password)
    }


    private func checkValidation() {
        guard let 
    }


    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(alertAction)
        present(alert, animated: true)
    }

}
