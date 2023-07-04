//
//  CheckDiabetesViewController.swift
//  EyeGlucose
//
//  Created by hamdi on 02/07/2023.
//

import UIKit

class CheckDiabetesViewController: UIViewController {
    @IBOutlet weak var btnUploadPhoto: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func btnUploadPhotoAction(_ sender: Any) {
        AlertHelper.uploadPhotoAlert(from: self)
    }
    


}
