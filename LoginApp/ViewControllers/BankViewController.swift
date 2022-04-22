//
//  BankViewController.swift
//  LoginApp
//
//  Created by Вячеслав Кусакин on 22.04.2022.
//

import UIKit

class BankViewController: UIViewController {
    
    @IBOutlet weak var userBalanceLabel: UILabel!

    var receivedUserBalance: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userBalanceLabel.text = receivedUserBalance
    }

    @IBAction func unwindToBankVC(for segue: UIStoryboardSegue) {
        if let addMoneyVC = segue.source as? AddMoneyViewController {
            guard let userBalance = Int(userBalanceLabel.text ?? "")
            else { return }

            guard let addedMoney = Int(addMoneyVC.addedMoneyLabel.text ?? "")
            else { return }

            userBalanceLabel.text = String(userBalance + addedMoney)

            /*
             Ниже нагородил тот же код, возвращающий добавленные деньги в банк, но только без гардов и пирамидой.
             Не хотелось сносить строки с гардом, которые не влезали в обозначенные 80 колонок.
             Какой вариант предпочтительнее?
             */

            //            if let one = Int(userBalanceLabel.text ?? "") {
            //                if let two = Int(addMoneyVC.addedMoneyLabel.text ?? "") {
            //                    userBalanceLabel.text = String(one + two)
            //                }
            //            }
        }
    }
}
