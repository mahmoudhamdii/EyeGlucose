//
//  Validator.swift
//  EyeGlucose
//
//  Created by hamdi on 02/06/2023.
//

import Foundation

protocol Validatation {
    func isValidEmail(email:String)->Bool
    func isValidPassword(password:String)->Bool
    func isValidName(name:String)->Bool
    func isValidNationalId(id:String)->Bool
    func isValidPhone(phone:String)->Bool
    func isValidConfirmPassword(password:String,confirmPassword:String)->Bool
}
class Validator :Validatation {
    var msg = ""
    internal func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            return emailPredicate.evaluate(with: email)
    }
    
    internal  func isValidPassword(password: String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[$@$#!%*?&]).{6,}$")
         return passwordTest.evaluate(with: password)
    }
    
    internal  func isValidName(name: String) -> Bool {
        let whitespaceCharacterSet = CharacterSet.whitespacesAndNewlines
            let nameWithoutWhitespace = name.trimmingCharacters(in: whitespaceCharacterSet)
            let components = nameWithoutWhitespace.components(separatedBy: whitespaceCharacterSet)
            
            return components.count == 1
    }
    
    internal func isValidNationalId(id: String) -> Bool {
        let idRegex = #"^\d{14}$"#
            let idPredicate = NSPredicate(format: "SELF MATCHES %@", idRegex)
            
            guard idPredicate.evaluate(with: id) else {
                return false
            }
            
            let digits = id.compactMap { Int(String($0)) }
            guard digits.count == 14 else {
                return false
            }
            
            let lastDigit = digits[13]
            var sum = 0
            
            for i in 0..<13 {
                let digit = digits[i]
                sum += digit * (14 - i)
            }
            
            let remainder = sum % 11
            let expectedCheckDigit = (remainder < 2) ? remainder : (11 - remainder)
            
            return lastDigit == expectedCheckDigit
    }
    
   internal func isValidPhone(phone: String) -> Bool {
        let mobileNumberRegex = "^01[0-9]{9}$"
            let mobileNumberPredicate = NSPredicate(format: "SELF MATCHES %@", mobileNumberRegex)
            return mobileNumberPredicate.evaluate(with: phone)
    }
    
   internal func isValidConfirmPassword(password: String,confirmPassword:String ) -> Bool {
        return password == confirmPassword
    }
     func goSignIn(email:String , password:String )->Bool {
        let  validEmail = isValidEmail(email: email)
        let  validpassword = isValidPassword(password: password)
        if validEmail && validpassword {
            return true
        }
        msg = "Invalid login. Please check your username and password."
        return false
        
    }
    func goSignUp(name:String,id:String,email:String,phone:String,password:String,confirmPassword:String)->Bool {
       
        if name == "" || id == "" || email == "" || phone == "" || password == "" || confirmPassword == "" {
            msg = "Please fill in all fields "
            return false
        }
        let validName = isValidName(name: name)
        let validNationalId = isValidNationalId(id: id)
        let validEmail = isValidEmail(email: email)
        let validPhone = isValidPhone(phone: phone)
        let validpassword = isValidPassword(password: password)
        let validConfirmPassword = isValidConfirmPassword(password: password, confirmPassword: confirmPassword)
        if validName && validNationalId && validEmail && validPhone && validpassword && validConfirmPassword {
           return true
        }else {
         
            if validName {
                if validNationalId {
                    if validEmail {
                        if validPhone{
                            if validpassword {
                                if validConfirmPassword{
                                    
                                }else{
                                    //non valid confirm password
                                    msg = "password doesn't match"
                                }
                            }else{
                                //nonValidPassword
                                msg = "please enter valid password "
                            }
                        }else{
                            //nonValidPhone
                            msg = "please enter valid phone number "
                        }
                    }else{
                        //nonvalid email
                        msg = "please enter valid email"
                    }
                }else{
                    //non valid id
                    msg = "please enter valid National id "
                }
            }else {
                
                //nonvalidName
                msg = "please enter valid name"
            }
            return false
        }
       

    }
    
    
    
}

