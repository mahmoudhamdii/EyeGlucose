//
//  UIView+Extensions.swift
//  EyeGlucose
//
//  Created by hamdi on 01/06/2023.
//

import Foundation
import UIKit
extension UIView {
    @IBInspectable var cornerRadius :CGFloat {
        get{
            return self.cornerRadius
            
        }
        set{
            self.layer.cornerRadius = newValue
            
        }
    }
}
