//
//  AlertHelper.swift
//  EyeGlucose
//
//  Created by hamdi on 04/06/2023.
//

import Foundation
import  UIKit


class AlertHelper {
    static func showAlert(from viewController: UIViewController, title: String, message: String,actionTittle:String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: actionTittle, style: .default, handler: nil)
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
}

