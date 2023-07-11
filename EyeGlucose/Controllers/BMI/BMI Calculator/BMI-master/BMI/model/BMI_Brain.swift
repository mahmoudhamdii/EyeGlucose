//
//  BMI_Brain.swift
//  BMI
//
//  Created by Ravi Thakur on 15/07/20.
//  Copyright © 2020 billidevelopers. All rights reserved.
//

import Foundation
import UIKit


struct BMI_Brain {
    

    var bmiValue: bmi_category?
    
    var advice = ""
           
    var color = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
    
    
    func getbmivalue() -> String{
        
        let bmi = String(format: "%.1f", bmiValue?.value ?? 0.0 )
            return bmi
    
    }
    
    mutating func calculate_Bmi(weight:Float,height:Float){
        
        
       let bmival = weight / (height * height)
    
        
        if bmival < 18.5{
            
        bmiValue = bmi_category(value: bmival, advice: " Hey please! eat more", color: #colorLiteral(red: 0.9450980392, green: 0.768627451, blue: 0.05882352941, alpha: 1))
            
            
        }else if bmival < 24.9{
            
           
            
        bmiValue = bmi_category(value: bmival, advice: "Hey congrats you are healthy keep it up!", color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
            
            
        }else{
            
        
        bmiValue = bmi_category(value: bmival, advice: " hey you are Overweight please do some excercise", color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
            
        }
        
    }
    
    
    func getcolor() -> UIColor{
        
        return bmiValue?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func getadvice() -> String{
        
        return bmiValue?.advice ?? "No Advice"
    }
    
    
    
}
