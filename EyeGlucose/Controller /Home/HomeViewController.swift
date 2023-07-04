//
//  HomeViewController.swift
//  EyeGlucose
//
//  Created by hamdi on 01/06/2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var FirstBtn: UIButton!
    @IBOutlet weak var secounBtn: UIButton!
    @IBOutlet weak var thirdBtn: UIButton!
    @IBOutlet weak var forthBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = false
        Animate.Ainmater.setAlpha0(items: [FirstBtn,secounBtn,thirdBtn,forthBtn])
        Animate.Ainmater.animateingMovement(items: [FirstBtn,secounBtn,thirdBtn,forthBtn])
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
    }
   
    @IBAction func firstBtnAction(_ sender: Any) {
        Animate.Ainmater.animateButtons(item: FirstBtn)
    }
    @IBAction func secoundBtnAction(_ sender: Any) {
        Animate.Ainmater.animateButtons(item: secounBtn)
    }
    @IBAction func thirdBtnAction(_ sender: Any) {
        Animate.Ainmater.animateButtons(item: thirdBtn)
    }
    
    @IBAction func forthBtnAction(_ sender: Any) {
        Animate.Ainmater.animateButtons(item: forthBtn)
    }
}
