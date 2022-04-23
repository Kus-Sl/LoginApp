//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Вячеслав Кусакин on 16.04.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.layer.cornerRadius = 15
        }
    }

    private lazy var user = User.getUser()

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController
        else { return }
        guard let viewControllers = tabBarController.viewControllers
        else { return }

        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.receivedUser = user
            } else if let aboutVC = viewController as? AboutViewController {
                aboutVC.receivedUser = user
            } else if let navigationVC = viewController as? UINavigationController {
                if let bankVC = navigationVC.topViewController as? BankViewController {
                    bankVC.receivedUser = user
                }
            }
        }
    }

    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTextField.text = nil
        passwordTextField.text = nil
    }

    @IBAction func loginButtonPressed() {
        checkValidation()
    }

    @IBAction func forgotUsernameOrPasswordButtonPressed(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Correct username", message: user.name)
        : showAlert(title: "Correct password", message: user.password)
    }

    private func checkValidation() {
        if usernameTextField.text != user.name
            || passwordTextField.text != user.password {
            showAlert(title: "Invalid username or password",
                      message: "Please, enter correct username or password"
            )
        }
    }
}

// MARK: Alert method
extension LoginViewController {

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
}

// MARK: Keyboard's methods
extension LoginViewController: UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case usernameTextField:
            passwordTextField.becomeFirstResponder()
        default:
            loginButtonPressed()
            performSegue(withIdentifier: "startSession", sender: nil)
        }
        return true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
