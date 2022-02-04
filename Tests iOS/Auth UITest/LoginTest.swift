//
//  LoginTest.swift
//  Tests iOS
//
//  Created by Dot Indonesia on 03/02/22.
//

import XCTest

class LoginTest: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFormLogin() throws {
        let username = app.textFields["Username or Email"]
        XCTAssert(username.exists)
        
        username.tap()
        username.typeText("test")

        XCTAssertNotEqual(username.value as! String, "")
        XCTAssertEqual(username.value as! String, "test")
        
        let passwordSecure = app.secureTextFields["Password"]
        XCTAssert(passwordSecure.exists)
        
        let visiblePassword = app.buttons["eyeButton"]
        app.buttons["eyeButton"].tap()
        XCTAssert(visiblePassword.exists)
        
        let password = app.textFields["Password"]
        XCTAssert(password.exists)
        
        password.tap()
        password.typeText("rahasia123")
        XCTAssertEqual(password.value as! String, "rahasia123")
        
        let loginNavBarTitle = app.staticTexts["Login"]
        let login = app.buttons["loginButton"]
        app.buttons["loginButton"].tap()
        
        XCTAssert(loginNavBarTitle.waitForExistence(timeout: 0.5))
        XCTAssert(login.exists)
        XCTAssertEqual(login.label, "Submit")
    }
    
    
    func testSubmitLogin() throws {
        app.textFields.element.tap()
        app.textFields.element.typeText("a@gmail.com")
     
        app.secureTextFields.element.tap()
        app.secureTextFields.element.typeText("rahasia123")
        app.keyboards.buttons["Return"].tap()
     
        let loginButton = app.buttons["loginButton"]
        loginButton.tap()
     
        XCTAssertTrue(loginButton.isEnabled)
    }

}
