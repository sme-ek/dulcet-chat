//
//  LoginViewController.swift
//  Dulcet Chat
//
//  Created by 🐱 on 9/7/21.
//

//TODO text field validation but i'm sleepy

import UIKit

class LoginViewController: UIViewController {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    } ()
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        return imageView
    } ()

    private let usernameField: UITextField = {
        let field = UITextField()
        field.returnKeyType = .continue
        field.layer.cornerRadius = 10
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Username"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        return field
    } ()
    private let passwordField: UITextField = {
        let field = UITextField()
        field.returnKeyType = .done //autologin when return key is pressed
        field.layer.cornerRadius = 10
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Password"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.isSecureTextEntry = true
        return field
    } ()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.setTitleColor(.gray, for: .normal)
        return button
    } ()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Log In"
        
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        
        //subviews here down
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(usernameField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(loginButton)
    
    }
    //subview specs
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        let size = view.frame.size.width/3
        imageView.frame = CGRect (x:(view.frame.size.width-size)/2, y:20, width: size, height: size)
        usernameField.frame = CGRect (x:30, y:imageView.bottom+10, width: scrollView.width-60, height: 52) //apparently 52 is standard height fuck ios dev
        passwordField.frame = CGRect (x:30, y:usernameField.bottom+10, width: scrollView.width-60, height: 52)
        loginButton.frame = CGRect (x:30, y:passwordField.bottom+10, width: scrollView.width-60, height: 52)
    }
    @objc private func didTapLoginButton(){
        guard let username = usernameField.text, let password = passwordField.text, !username.isEmpty, !password.isEmpty else{
            alertLoginError()
            return
        }
        
        //firebase login here l8r
    }
    func alertLoginError(){
        
        let alert = UIAlertController(title: "Oh Noes!", message: "Something went wrong! Please enter all your login information.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: .cancel, handler: nil))
        present(alert, animated: true)
}
}


