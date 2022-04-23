//
//  BankViewController.swift
//  LoginApp
//
//  Created by Вячеслав Кусакин on 22.04.2022.
//

import UIKit

class BankViewController: UIViewController {
    
    @IBOutlet weak var userBalanceLabel: UILabel!
    
    var receivedUser: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userBalanceLabel.text = receivedUser.bank
    }
    
    @IBAction func unwindToBankVC(for segue: UIStoryboardSegue) {
        if let addMoneyVC = segue.source as? AddMoneyViewController {
            if let one = Int(userBalanceLabel.text ?? "") {
                if let two = Int(addMoneyVC.addedMoneyLabel.text ?? "") {
                    userBalanceLabel.text = String(one + two)
                }
            }
        }
    }
}
