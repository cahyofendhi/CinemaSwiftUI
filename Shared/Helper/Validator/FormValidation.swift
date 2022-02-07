//
//  FormValidation.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Rumah Ulya on 24/01/22.
//

import Foundation


struct FormValidation {
    
    static func emailValidation(_ email: String) -> String? {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let isValid = emailPred.evaluate(with: email)
        if (email.isEmpty) {
            return "Email is required"
        } else if (!isValid) {
            return "Email not valid"
        } else {
            return nil
        }
    }
    
    static func passwordValidation(_ password: String) -> String? {
        if (password.isEmpty) {
            return "Password not be empty"
        } else if (password.count < 8) {
            return "Password atleast 8 character"
        } else {
            return nil
        }
    }
    
}
