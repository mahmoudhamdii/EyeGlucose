//
//  DiabetesViewController.swift
//  EyeGlucose
//
//  Created by hamdi on 03/07/2023.
//

import UIKit

class DiabetesViewController: UIViewController {
   
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var imgEyePhoto: UIImageView!
    @IBOutlet weak var btnShowResult: UIButton!
    @IBOutlet weak var lblErrorMsg: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnUploadEyephoto: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func btnCancelAction(_ sender: Any) {
        imgEyePhoto.image = nil
        btnUploadEyephoto.isEnabled = true
        btnShowResult.isHidden = true
        btnCancel.isHidden = true
    }
    @IBAction func btnShowResultAction(_ sender: Any) {
    }
    @IBAction func btnUploadEyePhotoAction(_ sender: Any) {
       
           uploadPhotoAlert()
    }
     func getPhoto (type :UIImagePickerController.SourceType){
        
        let piker = UIImagePickerController()
        piker.sourceType = type
        piker.allowsEditing = true
        piker.delegate = self
       present(piker, animated: true, completion: nil)
        
    }
    func uploadPhotoAlert () {
        let alert = UIAlertController(title: "Take photo from :", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default,handler: { action in
            self.getPhoto(type: .camera)
        }))
        alert.addAction(UIAlertAction(title: "Photo Library ", style: .default,handler: { action in
            self.getPhoto(type: .photoLibrary)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel,handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
   
    

}
extension DiabetesViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true,completion: nil)
        if let img = info[.editedImage] as? UIImage {
            imgEyePhoto.image = img
     
            btnShowResult.isHidden = false
            btnCancel.isHidden = false
            btnUploadEyephoto.isEnabled = false
            
        }else {
            btnShowResult.isHidden = true
            btnCancel.isHidden = true
            lblErrorMsg.text = "Can't find Photo Please upload it again."
           
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: true,completion: nil)
    }
    
    
}

