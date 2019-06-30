//
//  MainPageController.swift
//  Audible
//
//  Created by Omar Alqabbani on 6/30/19.
//  Copyright © 2019 OmarALqabbani. All rights reserved.
//

import UIKit

class MainPageController: UIViewController {
    let mainImageView: UIImageView = {
        let imv = UIImageView()
        imv.translatesAutoresizingMaskIntoConstraints = false
        imv.image = UIImage(named: "home")
        return imv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "we are logged in"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(handleSignOut))
        setViewComponents()
    }
    
    @objc func handleSignOut(){
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
        UserDefaults.standard.setLoggedIn(value: false)
    }
    
    func setViewComponents() {
        self.view.addSubview(mainImageView)
        
        mainImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}
