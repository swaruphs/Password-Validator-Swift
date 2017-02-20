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
        
        return false
    }
}
