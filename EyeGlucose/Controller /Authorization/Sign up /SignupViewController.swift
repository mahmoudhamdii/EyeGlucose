//
//  SignupViewController.swift
//  EyeGlucose
//
//  Created by hamdi on 06/06/2023.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var confirmPasswordTxf: UITextField!
    @IBOutlet weak var passwordTxf: UITextField!
    @IBOutlet weak var phoneTxf: UITextField!
    @IBOutlet weak var emailTxf: UITextField!
    @IBOutlet weak var idTxf: UITextField!
    @IBOutlet weak var nameTxf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTxf.delegate = self
        phoneTxf.delegate = self
        emailTxf.delegate = self
        idTxf.delegate = self
        passwordTxf.delegate = self
        confirmPasswordTxf.delegate = self
        
    }
    
   
    @IBAction func btnSignupAction(_ sender: Any) {
        let valditor = Validator()
     let signupStaus =   valditor.goSignUp(name: nameTxf.text ?? "", id: idTxf.text ?? "", email: emailTxf.text ?? "", phone: phoneTxf.text ?? "", password: passwordTxf.text ?? "", confirmPassword: confirmPasswordTxf.text ?? "")
        if signupStaus {
            // succsess signup
            let controller = HomeViewController.instantiate()
            present(controller, animated: true,completion: nil)
        }else{
           // faild to signUp
            let massage = valditor.msg
            AlertHelper.showAlert(from: self, title: "Sign UP Failed  ", message: massage, actionTittle: "Ok")
        }
        
    }
    
    @IBAction func btnSigninAction(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    
}
extension SignupViewController :UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var  arrFields = [nameTxf,idTxf,emailTxf,phoneTxf,passwordTxf,confirmPasswordTxf]
        var i = 0
        while true {
            if textField == arrFields[i]
            {
                if i == arrFields.count - 1 {
                    btnSignupAction(UIButton.self)
                }else{
                    arrFields[i+1]?.becomeFirstResponder()
                }
                break
            }
            i = i + 1
            
        }
            
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
