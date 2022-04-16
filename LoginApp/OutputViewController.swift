//
//  OutputViewController.swift
//  LoginApp
//
//  Created by Вячеслав Кусакин on 16.04.2022.
//

import UIKit

class OutputViewController: UIViewController {

    @IBOutlet weak var welcomeTitle: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let backgroundOutputVC = GradientColor()
        backgroundOutputVC.gradientLayer.frame = view.frame
        view.layer.insertSublayer(backgroundOutputVC.gradientLayer, at: 0)
    }

    @IBAction func logoutButtonPressed() {
    }
}

class GradientColor {

    var gradientLayer: CAGradientLayer {
        gradientLayerSet
    }

    private let gradientLayerSet: CAGradientLayer

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
        gradientLayerSet = CAGradientLayer()
        gradientLayerSet.colors = [gradientColorTop, gradientColorBottom]
        gradientLayerSet.locations = [0.1, 0.9]
    }
}
