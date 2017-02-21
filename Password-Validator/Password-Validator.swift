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
    
    fileprivate var characterSet:CharacterSet {
        switch self {
        case .UpperCase:
            return NSCharacterSet.uppercaseLetters
        case .LowerCase:
            return NSCharacterSet.lowercaseLetters
        case .Digit:
            return NSCharacterSet.decimalDigits
        case .SpecialCharacter:
            return NSCharacterSet.symbols
        }
        
    }
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
            
            let hasMember = pwdString.unicodeScalars.contains { ( u: UnicodeScalar) -> Bool in
                rule.characterSet.contains(u)
            }
            
            if hasMember == false {
                return false
            }
            
        }
        
        return true
        
    }
}
