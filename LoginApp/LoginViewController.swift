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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showOutputVC" else { return }
        guard let outputVC = segue.destination as? OutputViewController else {
            return
        }
        outputVC.welcomeText = usernameTextField.text
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    @IBAction func loginButtonPressed() {
        checkValidation()
    }

    @IBAction func forgotUsernameOrPasswordButtonPressed(_ sender: UIButton) {
            sender.tag == 0
        ? showAlert(title: "Correct username", message: username)
        : showAlert(title: "Correct password", message: password)
    }

    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTextField.text = nil
        passwordTextField.text = nil
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case usernameTextField:
            passwordTextField.becomeFirstResponder()
        default:
            loginButtonPressed()
            performSegue(withIdentifier: "showOutputVC", sender: self)
        }
        return true
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        let alertAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = nil
        }

        alert.addAction(alertAction)
        present(alert, animated: true)
    }

    private func checkValidation() {
        if !(usernameTextField.text == username
            && passwordTextField.text == password) {
            showAlert(title: "Invalid username or password", message: "Please, enter correct username or password")
        }
    }
}
