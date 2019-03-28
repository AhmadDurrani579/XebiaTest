//
//  ZGConstants.swift
//  ZoGoo
//
//  Created by Salman Nasir on 20/02/2017.
//  Copyright © 2017 Salman Nasir. All rights reserved.
//

import UIKit



  struct setBoarder {
    let view : UIView?
    let width : CGFloat?
    let color : UIColor?
    
    @discardableResult  init(view: UIView, width: CGFloat , color : UIColor ) {
        self.view = view
        self.width  = width
        self.color  = color
        view.layer.borderColor = color.cgColor
        view.layer.borderWidth = 1
        
        

    }
}

enum WAUserType : Int
{
    case WAUser = 0 ,
    WAVendor
    
}

enum TQActionType: Int {
    case TQLogin = 0,
    TQSignup,
    TQForgetPassword ,
    TQSkip
}

var DEVICE_TOKEN: String = ""
let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEGHT = UIScreen.main.bounds.height
var DEVICE_LAT =  0.0
var DEVICE_LONG = 0.0
var DEVICE_ADDRESS = ""
var SELECTUSER = ""



let IS_IPHONE_5 = (UIScreen.main.bounds.width == 320)
let IS_IPHONE_6 = (UIScreen.main.bounds.width == 375)
let IS_IPHONE_6P = (UIScreen.main.bounds.width == 414)

//LIVE URL


//  API Contant

let BASE_URL  =  "https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=3jtEmAoJpns20C6qWhAZYwWcv2yHZJZ0"





//





