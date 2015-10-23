//
//  Event.swift
//  final_project
//
//  Created by Thanh Nguyen on 10/22/15.
//  Copyright © 2015 thanhcs. All rights reserved.
//

import UIKit

class Event: NSObject {
    private var _title:String = ""
    private var _date:String = ""
    private var _location:String = ""
//    private var _tags:[String] = [String]()
    private var _host:String = ""
    private var _description:String = ""
    private var _capacity:Int = 0
    
    init(title:String, date:String, location:String, host:String, description:String, capacity:Int) {
        super.init()
        _title = title
        _date = date
        _location = location
        _host = host
//        _tags = tags
        _description = description
        _capacity = capacity
    }
    
    var title:String {
        get {
            return _title
        }
        set (value) {
            _title = value
        }
    }
    
    var date:String {
        get {
            return _date
        }
        set (value) {
            _date = value
        }
    }
    
    var location:String {
        get {
            return _location
        }
        set (value) {
            _location = value
        }
    }
    
//    var tags:[String] {
//        get {
//            return _tags
//        }
//        set (value) {
//            _tags = value
//        }
//    }
    
    var host:String {
        get {
            return _host
        }
        set (value) {
            _host = value
        }
    }
    
    var desc:String {
        get {
            return _description
        }
        set (value) {
            _description = value
        }
    }
    
    var capacity:Int {
        get {
            return _capacity
        }
        set (value) {
            _capacity = value
        }
    }

}
