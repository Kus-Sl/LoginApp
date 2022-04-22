//
//  AddMoneyViewController.swift
//  LoginApp
//
//  Created by Вячеслав Кусакин on 22.04.2022.
//

import UIKit

class AddMoneyViewController: UIViewController {

    @IBOutlet weak var addedMoneyLabel: UILabel!

    @IBOutlet weak var addMoneyButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        addMoneyButton.layer.cornerRadius = 10
    }

    @IBAction func setValueOfAddedMoney(_ sender: UIStepper) {
        addedMoneyLabel.text = String(Int(sender.value))
    }
}
