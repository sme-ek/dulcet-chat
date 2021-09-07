//
//  ViewController.swift
//  Dulcet Chat
//
//  Created by 🐱 on 9/7/21.
//

import UIKit

class ChatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let isLoggedIn = UserDefaults.standard.bool(forKey: "logged_in")
        if !isLoggedIn{
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                present (nav, animated: false)
        }
    }


}

