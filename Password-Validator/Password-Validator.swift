//
//  Password-Validator.swift
//  Password-Validator
//
//  Created by Swarup on 20/2/17.
//
//

import Foundation


public enum ValidationRules {
    case UpperCase
    case LowerCase
    case Digit
    case SpecialCharacter
}


public struct PasswordValidator {
    var minLength  = 0
    var maxLength = 128
    
    var rules: [ValidationRules] = [.LowerCase]
    
    
    public init(rules validationRules:[ValidationRules] = [.LowerCase], minLength min:Int = 0, maxLength max:Int = 128) {
        
        minLength = min
        maxLength = max
        
        if validationRules.count > 0 {
            rules = validationRules
        }
    }
    
    public func isValid(password pwdString: String) -> Bool {
        
        if pwdString.characters.count < minLength {
            return false
        }
        
        if pwdString.characters.count > maxLength {
            return false
        }
        
        for rule in self.rules {
            switch rule {
            case .LowerCase:
                
                let lowercase = NSCharacterSet.lowercaseLetters
                let hasLower = pwdString.unicodeScalars.contains { ( u: UnicodeScalar) -> Bool in
                    lowercase.contains(u)
                }
                
                if hasLower == false {
                    return false
                }
            case .UpperCase:
                let uppercase = NSCharacterSet.uppercaseLetters
                let hasUpper = pwdString.unicodeScalars.contains { ( u: UnicodeScalar) -> Bool in
                    uppercase.contains(u)
                }
                
                if hasUpper == false {
                    return false
                }
            case .Digit:
                let digit = NSCharacterSet.decimalDigits
                let hasDigit = pwdString.unicodeScalars.contains {( u: UnicodeScalar) -> Bool in
                    digit.contains(u)
                }
                
                if hasDigit == false {
                    return false
                }
                
                
            default:
                break
            }
        }
        
        return true
        
        
        
    }
}
