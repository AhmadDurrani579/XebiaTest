//
//  UIViewcontrollerExtension.swift
//  WhereApp
//
//  Created by Salman Nasir on 10/03/2017.
//  Copyright © 2017 Ilsainteractive. All rights reserved.
//

import UIKit
import CoreLocation

//protocol popForviewController : class {
//    func AcceptButtonClick()
//    func RejectButtonClick()
//}
//
//enum ToggleState {
//    case on
//    case off
//}

extension UIViewController {
    


    func showAlert(title: String, message: String, controller: UIViewController?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        if controller != nil {
            controller?.present(alert, animated: true, completion: nil)
        }else {
            present(alert, animated: true, completion: nil)
        }
        

    }
    
    func showConfirmationAlertViewWithTitle(title:String,message : String, dismissCompletion:@escaping (AlertViewDismissHandler))
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alertController.addAction(UIAlertAction(title: "NO", style: .cancel, handler: { action -> Void in
            //Do some other stuff
            
        }))
        alertController.addAction(UIAlertAction(title: "YES", style: .default, handler: { action -> Void in
            //Do some other stuff
            dismissCompletion()
        }))

        
        present(alertController, animated: true, completion:nil)
    }

    
    func showAlertViewWithTitle(title:String,message : String, dismissCompletion:@escaping (AlertViewDismissHandler))
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { action -> Void in
            //Do some other stuff
            dismissCompletion()
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { action -> Void in
            //Do some other stuff
//            dismissCompletion()
        }))
        
        present(alertController, animated: true, completion:nil)
    }

    
    @IBAction func popController(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    

    func pushToViewControllerWithStoryboardID(storyboardId:String) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: storyboardId)
        self.navigationController?.pushViewController(vc, animated: true)
    }

    
}
