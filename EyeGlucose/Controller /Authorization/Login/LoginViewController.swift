//
//  LoginViewController.swift
//  EyeGlucose
//
//  Created by hamdi on 31/05/2023.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var passwordTxf: UITextField!
    @IBOutlet weak var emailTxf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTxf.delegate = self
        passwordTxf.delegate = self
        
    }
    
    @IBAction func btnSignupAction(_ sender: Any) {
        let controller = SignupViewController.instantiate()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    @IBAction func btnLoginAction(_ sender: Any) {
        let   valditor = Validator()
        let loginStatus =  valditor.goSignIn(email: emailTxf.text ?? "", password: passwordTxf.text ?? "")
        if loginStatus
        {
            // succsess login
            let controller = HomeViewController.instantiate()
            present(controller, animated: true,completion: nil)
            
        }
        else
        {
            // faild login
            let massage = valditor.msg
            AlertHelper.showAlert(from: self, title: "Login failed", message: massage, actionTittle: "OK")
            passwordTxf.text = ""
            
        }
        
        
        
    }
}




extension LoginViewController :UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTxf {
            
            passwordTxf.becomeFirstResponder()
        }else{
            btnLoginAction(UIButton.self)
        }
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

