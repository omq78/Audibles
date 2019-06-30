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
        return UserDefaults.standard.getLoggedIn()
    }
    
    @objc func showLoginController(){
        let loginController = LoginController()
        present(loginController, animated: true) {
            // present login controller completed then ...
        }
    }
}


