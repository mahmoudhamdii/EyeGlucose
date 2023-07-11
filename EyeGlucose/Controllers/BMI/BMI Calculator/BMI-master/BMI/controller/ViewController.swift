//
//  ViewController.swift
//  BMI
//
//  Created by Ravi Thakur on 15/07/20.
//  Copyright © 2020 billidevelopers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var brain = BMI_Brain()
    
    
    
    
    @IBOutlet weak var heightslider: UISlider!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var grnderimage: UIImageView!
    @IBOutlet weak var weightslider: UISlider!
    @IBOutlet weak var boygirlsegment: UISegmentedControl!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    

    @IBAction func calculate(_ sender: Any) {
        
        
        let height = heightslider.value
        let weight = weightslider.value
        
        brain.calculate_Bmi(weight: weight, height: height)
        
        if brain.bmiValue != nil{
            
            getpopupresult()
        }
       
        
    }
    
    
    
    
    @IBAction func segment(_ sender: Any) {
        
        
        if boygirlsegment.selectedSegmentIndex == 0{
            
            
            grnderimage.image = UIImage(named: "boy")
            
            
        }else{
            
            grnderimage.image = UIImage(named: "girl")
        
        }
        
    }
    
    
    
    @IBAction func heightslider(_ sender: UISlider) {
        
        
      let heightinm = String(format: "%.2f", sender.value)
        

        height.text = "\(heightinm)cm"
        
    }
    
    
    
    
    @IBAction func weightslider(_ sender: UISlider) {
        
        let weightinkg = String(format: "%.0f", sender.value)
        
        weight.text = "\(weightinkg)kg"
        
    }
    
    
    
    func getpopupresult(){
        
        let popvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mybmipop") as! resultvc
               
               self.addChild(popvc)
               
               popvc.view.frame = self.view.frame
               
               self.view.addSubview(popvc.view)
               
               popvc.didMove(toParent: self)
               
        popvc.bmi.text = brain.getbmivalue()
                          
        popvc.bmisuggestion.text = brain.getadvice()
                          
        popvc.backview.backgroundColor = brain.getcolor()
        
        popvc.genderimage.image = grnderimage.image
    }

}

