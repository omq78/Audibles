//
//  UserDefaultsExtension.swift
//  Audible
//
//  Created by Omar Alqabbani on 6/30/19.
//  Copyright © 2019 OmarALqabbani. All rights reserved.
//

import UIKit

extension UserDefaults {
    enum userDefaultKeys: String {
        case isLoggedIn
    }
    
    func setLoggedIn(value: Bool) {
        set(value, forKey: userDefaultKeys.isLoggedIn.rawValue)
        synchronize()
    }
    
    func getLoggedIn() -> Bool {
        return bool(forKey: userDefaultKeys.isLoggedIn.rawValue)
    }
}
