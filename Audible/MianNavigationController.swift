//
//  MianNavigationController.swift
//  Audible
//
//  Created by Omar Alqabbani on 6/29/19.
//  Copyright © 2019 OmarALqabbani. All rights reserved.
//

import UIKit

class MianNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        if checkLogin() {
            // start with main page
            let mainPage = MainPageController()
            viewControllers = [mainPage]
        } else {
            // start with login page
            perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
        }
        
    }
    
    func checkLogin() -> Bool {
        return false
    }
    
    @objc func showLoginController(){
        let loginController = LoginController()
        present(loginController, animated: true) {
            // present login controller completed then ...
        }
    }
}


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
        setViewComponents()
    }
    
    func setViewComponents() {
        self.view.addSubview(mainImageView)
        
        mainImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}
