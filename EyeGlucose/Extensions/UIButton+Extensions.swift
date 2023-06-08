//
//  UIButton+Extensions.swift
//  EyeGlucose
//
//  Created by hamdi on 01/06/2023.
//

import Foundation
import UIKit
extension UIButton {
    @IBInspectable var btnCornerRadius :CGFloat {
        get{
            return self.btnCornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
