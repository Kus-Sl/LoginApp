//
//  OutputViewController.swift
//  LoginApp
//
//  Created by Вячеслав Кусакин on 16.04.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var receivedWelcomeLabel: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome, " + receivedWelcomeLabel
        
        let backgroundWelcomeVC = GradientColor()
        backgroundWelcomeVC.gradientLayer.frame = view.frame
        view.layer.insertSublayer(backgroundWelcomeVC.gradientLayer, at: 0)
    }
}

class GradientColor {
    var gradientLayer = CAGradientLayer()
    
    private let gradientColorTop = UIColor(
        red: 44 / 255,
        green: 25 / 255,
        blue: 148 / 255,
        alpha: 1
    ).cgColor
    
    private let gradientColorBottom = UIColor(
        red: 198 / 255,
        green: 17 / 255,
        blue: 17 / 255,
        alpha: 1
    ).cgColor
    
    init () {
        gradientLayer.colors = [gradientColorTop, gradientColorBottom]
        gradientLayer.locations = [0.1, 0.9]
    }
}
