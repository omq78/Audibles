//
//  LoginCell.swift
//  Audible
//
//  Created by Omar Alqabbani on 6/28/19.
//  Copyright © 2019 OmarALqabbani. All rights reserved.
//

import UIKit

protocol LoginControllerDelegate: class {
    func finshLoggedIn()
}

class LoginCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCellComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let loginImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "logo")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let emailTextView: UITextField = {
        let tv = leftPaddedTextField()
        tv.keyboardType = .emailAddress
        tv.placeholder = "Enter Email"
        tv.layer.borderColor = UIColor.lightGray.cgColor
        tv.layer.borderWidth = 1
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    let passwordTextView: UITextField = {
        let tv = leftPaddedTextField()
        tv.isSecureTextEntry = true
        tv.placeholder = "Enter Password"
        tv.layer.borderColor = UIColor.lightGray.cgColor
        tv.layer.borderWidth = 1
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    lazy var loginButton: UIButton = {
        let but = UIButton(type: .system)
        but.setTitle("Log In", for: .normal)
        but.setTitleColor(UIColor.white, for: .normal)
        but.backgroundColor = UIColor.orange
        but.translatesAutoresizingMaskIntoConstraints = false
        but.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return but
    }()

    weak var delegate: LoginControllerDelegate?
    @objc func handleLogin(){
        delegate!.finshLoggedIn()
    }
    
    func setCellComponents(){
        
        addSubview(loginImage)
        addSubview(emailTextView)
        addSubview(passwordTextView)
        addSubview(loginButton)
        
        loginImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loginImage.topAnchor.constraint(equalTo: centerYAnchor, constant: -230).isActive = true
        loginImage.widthAnchor.constraint(equalToConstant: 160).isActive = true
        loginImage.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        
        emailTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 32).isActive = true
        emailTextView.topAnchor.constraint(equalTo: loginImage.bottomAnchor, constant: 8).isActive = true
        emailTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -32).isActive = true
        emailTextView.heightAnchor.constraint(equalToConstant: 50).isActive = true

        passwordTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 32).isActive = true
        passwordTextView.topAnchor.constraint(equalTo: emailTextView.bottomAnchor, constant: 16).isActive = true
        passwordTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -32).isActive = true
        passwordTextView.heightAnchor.constraint(equalToConstant: 50).isActive = true

        loginButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 32).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordTextView.bottomAnchor, constant: 16).isActive = true
        loginButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -32).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

    }
}


class leftPaddedTextField: UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width - 10, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width - 10, height: bounds.height)
    }
}
