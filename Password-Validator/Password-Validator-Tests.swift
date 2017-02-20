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
    
}
