//
//  Password-Validator-Tests.swift
//  Password-Validator
//
//  Created by Swarup on 20/2/17.
//
//

import XCTest
import PasswordValidator

class Password_Validator_Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIfPasswordValid() {
        let validator = PasswordValidator.init()
        XCTAssert(validator.isValid(password: "Hello"))
    }
    
    
    func testMinLengthValid() {
        let validator = PasswordValidator.init(minLength: 6)
        XCTAssert(validator.isValid(password: "Helloo") == true)
    }
    
    func testMinLengthInvalid() {
        let validator = PasswordValidator.init(minLength: 6)
        XCTAssert(validator.isValid(password: "Hello") == false)
    }
    
    func testMaxLengthValid() {
        let validator = PasswordValidator.init(maxLength: 10)
        XCTAssert(validator.isValid(password: "Hello") == true)
    }
    
    func testMaxLengthInvalid() {
        let validator = PasswordValidator.init(maxLength: 9)
        XCTAssert(validator.isValid(password: "1234567890") == false)
    }
    
    func testUppercasePasswordValid() {
        let validator = PasswordValidator.init(rules: [.UpperCase])
        XCTAssert(validator.isValid(password: "Hello") == true)
    }
    
    func testUppercasePasswordInvalid() {
        let validator = PasswordValidator.init(rules: [.UpperCase])
        XCTAssert(validator.isValid(password: "hello") == false)
    }
    
    func testLowercasePasswordValid() {
        let validator = PasswordValidator.init(rules: [.LowerCase])
        XCTAssert(validator.isValid(password: "HELLo") == true)
    }
    
    func testLowercasePasswordInvalid() {
        let validator = PasswordValidator.init(rules: [.LowerCase])
        XCTAssert(validator.isValid(password: "HELLO") == false)
    }
    
    
    func testPasswordHasDigitValid() {
        let validator = PasswordValidator.init(rules: [.Digit])
        XCTAssert(validator.isValid(password: "Hello1"))
    }
    
    func testPasswordHasDigitInValid() {
        let validator = PasswordValidator.init(rules: [.Digit])
        XCTAssert(validator.isValid(password: "hello") == false)
    }
}
