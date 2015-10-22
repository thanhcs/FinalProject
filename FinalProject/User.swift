//
//  User.swift
//  final_project
//
//  Created by Thanh Nguyen on 10/22/15.
//  Copyright © 2015 thanhcs. All rights reserved.
//

import UIKit

class User: NSObject {
    private var _username:String = ""
    private var _password:String = ""
    
    init(username:String, password:String) {
        super.init()
        _username = username
        _password = password
    }
    
    var username:String {
        get {
            return _username
        }
        set (value) {
            _username = value
        }
    }
    
    var password:String {
        get {
            return _password
        }
        set (value) {
            _password = value
        }
    }

}
