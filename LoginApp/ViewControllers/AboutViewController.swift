//
//  AboutViewController.swift
//  LoginApp
//
//  Created by Вячеслав Кусакин on 22.04.2022.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var userImage: UIImageView!

    var receivedUser: User!

    override func viewDidLoad() {
        super.viewDidLoad()

        userImage.image = UIImage(named: receivedUser.photo)
    }
}
