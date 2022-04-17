//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Вячеслав Кусакин on 16.04.2022.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var loginButton: UIButton!

    private let username = "User"
    private let password = "777"

    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        passwordTextField.delegate = self

        loginButton.layer.cornerRadius = 15
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if usernameTextField.isEditing {
            passwordTextField.becomeFirstResponder()
        } else if passwordTextField.isEditing {
            loginButtonPressed()
            performSegue(withIdentifier: "showOutputVC", sender: self)
        }
        return true
    }

    @IBAction func loginButtonPressed() {
        checkValidation()
    }
    
    @IBAction func forgotUsernamePressed() {
        showAlert(title: "Correct username", message: username)
    }
    
    @IBAction func forgotPasswordPressed() {
        showAlert(title: "Correct password", message: password)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showOutputVC" else { return }
        guard let outputVC = segue.destination as? OutputViewController else {
            return
        }
        outputVC.welcomeText = usernameTextField.text
    }

    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard segue.identifier == "showLoginVC" else { return }
        guard let loginVC = segue.destination as? LoginViewController else {
            return
        }
        loginVC.usernameTextField.text = nil
        loginVC.passwordTextField.text = nil
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        let alertAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(alertAction)
        present(alert, animated: true)
    }

    private func checkValidation() {
        guard let checkedUsername = usernameTextField.text else { return }
        guard let checkedPassword = passwordTextField.text else { return }

        !(checkedUsername == username && checkedPassword == password)
        ? showAlert(title: "Invalid username or password", message: "Please, enter correct username or password")
        : nil
    }
}
