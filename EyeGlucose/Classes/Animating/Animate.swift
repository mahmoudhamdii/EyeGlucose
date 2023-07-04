//
//  Animate.swift
//  EyeGlucose
//
//  Created by hamdi on 24/06/2023.
//

import Foundation
import UIKit
class Animate {
    static var Ainmater = Animate()
  private  init() {
        
    }
    func animateButtons(item:UIButton){
        UIView.animate(withDuration: 0.8) {
            
            item.layer.transform = CATransform3DMakeScale(1.1,1.1, 1)
           

        } completion: { completed in
            if completed {
                UIView.animate(withDuration: 0.5) {
                   
                        item.layer.transform  = CATransform3DMakeScale(1, 1, 1)
                   
                }
            }
        }

        
    }
    func setAlpha0 (items:[UIButton]){
        for item in items {
            item.alpha = 0
        }
    }
    func animateingMovement (items:[UIButton]){
        UIView.animate(withDuration: 2.5) {
            for item in items {
                item.alpha = 1
            }
            for item in items {
                item.center.y += 50
            }
            
        }
        
    }
}
