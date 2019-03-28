//
//  WebServiceManager.swift
//  Thoubk
//
//  Created by Nouman Tariq on 9/7/16.
//  Copyright © 2016 ilsainteractive. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import SVProgressHUD


enum MappingResult<T> {
    case asSelf(T)
    case asDictionary([String: T])
    case asArray([T])
    case raw(Data)
}


class WebServiceManager: NSObject  {
    
    static var serviceCount = 0
    
    class func progressHudSetting()  {
        SVProgressHUD.setCornerRadius(40)
        SVProgressHUD.setBackgroundColor(#colorLiteral(red: 0.5293717384, green: 0.5293846726, blue: 0.5293776989, alpha: 1))
        SVProgressHUD.setForegroundColor(UIColor.init(named: "text_color")!)
        SVProgressHUD.setBorderColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        SVProgressHUD.setBorderWidth(1)
    }
    
    class func get<T: AnyObject>(params: Dictionary<String, AnyObject>?, serviceName: String, serviceType: String, modelType: T.Type, success: @escaping (_ servicResponse: AnyObject) -> Void, fail: (_ error: NSError) -> Void) where T: Mappable {
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 60
        SVProgressHUD.show()
        progressHudSetting()

        showNetworkIndicator()
        
        Alamofire.request(serviceName, method: .get, parameters: params, encoding: JSONEncoding.default, headers: nil).responseObject { (response: DataResponse<T>) in
            hideNetworkIndicator()
            switch response.result {
            case .success(let objectData):
                print(objectData)
                                SVProgressHUD.dismiss()
                
                
                success(objectData)
                break
            case .failure(let error):
                                SVProgressHUD.dismiss()
                
                print(error.localizedDescription)
            }
        }
    }

    
    
    
    class func showNetworkIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        WebServiceManager.serviceCount += 1
    }
    
    class func hideNetworkIndicator() {
        WebServiceManager.serviceCount -= 1
        if WebServiceManager.serviceCount == 0 {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}

class Connectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}


