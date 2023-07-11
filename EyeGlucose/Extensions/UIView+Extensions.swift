//
//  UIView+Extensions.swift
//  EyeGlucose
//
//  Created by hamdi on 01/06/2023.
//

import Foundation
import UIKit
extension UIView {
    @IBInspectable var viewCornerRadius :CGFloat {
        get{
            return self.viewCornerRadius
            
        }
        set{
            self.layer.cornerRadius = newValue
            
        }
    }
    
}


