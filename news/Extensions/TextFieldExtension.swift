//
//  TextFieldExtension.swift
//  news
//
//  Created by Евгений Маглена on 27.12.2021.
//

import Foundation
import UIKit


extension RegistrationViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == nameTextField {
            data.otherData["name"] = textField.text ?? "error"
            data.name = textField.text ?? "error"
        } else if textField == surnameTextField {
            data.otherData["surname"] = textField.text ?? "error"
            data.surname = textField.text ?? "error"
        }else if textField == birthdayTextField {
            data.otherData["birthday"] = textField.text ?? "error"
            data.birthday = textField.text ?? "error"
        }else if textField == emailTextField {
            data.data["email"] = textField.text ?? "error"
            data.email = textField.text ?? "error"
        }else if textField == passwordTextField {
            data.data["password"] = textField.text ?? "error"
            data.password = textField.text ?? "error"
            print(data)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
