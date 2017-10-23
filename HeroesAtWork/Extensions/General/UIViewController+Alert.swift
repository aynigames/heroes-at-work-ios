//
//  UIViewControllerAlertExtension.swift
//  SOSMujer
//
//  Created by agamarra on 12/16/15.
//  Copyright © 2015 Bennu.tv. All rights reserved.
//

import UIKit

//Alert Extension
extension UIViewController {

//    func showErrorView(withMessage message:String) {
//        self.showAlertView(withTitle: NSLocalizedString("Error", comment: "Error"), withMessage: message)
//    }
//    
//    func showErrorView(withMessage message:String, withInvalidTextField invalidTextField:ABSValidateTextField) {
//        self.showAlertView(withTitle: NSLocalizedString("Error", comment: "Error"), withMessage: message, withInvalidTextField: nil, withResponseBlock: nil)
//    }
//    
//    func showAlertView(withMessage message:String) {
//        self.showAlertView(withTitle: NSLocalizedString("Alert", comment: "Alerta"), withMessage: message)
//    }
//    
//    func showAlertView(withMessage message:String, withInvalidTextField invalidTextField:ABSValidateTextField) {
//        self.showAlertView(withTitle: NSLocalizedString("Alert", comment: "Alerta"), withMessage: message, withInvalidTextField: nil, withResponseBlock: nil)
//    }
//    
//    func showAlertView(withTitle title:String, withMessage message:String) {
//        self.showAlertView(withTitle: title, withMessage: message, withInvalidTextField: nil, withResponseBlock: nil)
//    }
//    
//    func showAlertView(withTitle title:String, withMessage message:String, withResponseBlock responseBlock:(() -> Void)?) {
//        self.showAlertView(withTitle: title, withMessage: message, withInvalidTextField: nil, withResponseBlock: responseBlock)
//    }
//    
//    func showAlertView(withTitle title:String, withMessage message:String, withInvalidTextField textField:ABSValidateTextField?) {
//        self.showAlertView(withTitle: title, withMessage: message, withInvalidTextField: textField, withResponseBlock: nil)
//    }
//    
//    func showAlertView(withTitle title:String, withMessage message:String, withInvalidTextField textField:ABSValidateTextField?, withResponseBlock responseBlock:(() -> Void)?) {
//        textField?.valid = false
//        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let okAction = UIAlertAction(title: NSLocalizedString("OK", comment: "OK"), style: .default) { (action:UIAlertAction) -> Void in
//            if (responseBlock != nil) {
//                responseBlock!()
//            }
//            textField?.valid = true
//            alertViewController.dismiss(animated: true, completion: nil)
//        }
//        alertViewController.addAction(okAction)
//        self.present(alertViewController, animated: true, completion: nil)
//    }
//    
//    func showOkCancelAlertView(withTitle title:String, withMessage message:String, withResponseBlock responseBlock:@escaping (_ isOk:Bool) -> Void) {
//        let okTitle = NSLocalizedString("OK", comment: "OK")
//        self.showOkCancelAlertView(withTitle: title, withMessage: message, withOkTitle: okTitle, withResponseBlock: responseBlock)
//    }
//    
//    func showOkCancelAlertView(withTitle title:String, withMessage message:String, withOkTitle okTitle:String, withResponseBlock responseBlock:@escaping (_ isOk:Bool) -> Void) {
//        let cancelTitle = NSLocalizedString("Cancel", comment: "Cancel")
//        self.showOkCancelAlertView(withTitle: title, withMessage: message, withOkTitle: okTitle, withCancelTitle: cancelTitle, withResponseBlock: responseBlock)
//    }
//    
//    func showOkCancelAlertView(withTitle title:String
//        , withMessage message:String
//        , withOkTitle okTitle:String
//        , withCancelTitle cancelTitle:String
//        , withResponseBlock responseBlock:@escaping (_ isOk:Bool) -> Void) {
//        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let cancelAction = UIAlertAction(title: cancelTitle, style: .default) { (action:UIAlertAction) -> Void in
//            responseBlock(false)
//            alertViewController.dismiss(animated: true, completion: nil)
//        }
//        let okAction = UIAlertAction(title: okTitle, style: .default) { (action:UIAlertAction) -> Void in
//            responseBlock(true)
//            alertViewController.dismiss(animated: true, completion: nil)
//        }
//        alertViewController.addAction(cancelAction)
//        alertViewController.addAction(okAction)
//        self.present(alertViewController, animated: true, completion:nil)
//    }
    
}

