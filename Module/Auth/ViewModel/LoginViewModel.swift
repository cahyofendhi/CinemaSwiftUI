//
//  LoginViewModel.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Rumah Ulya on 24/01/22.
//

import Foundation

struct LoginState: Equatable {
    var email: String = ""
    var password: String = ""
    var emailError: String?
    var passwordError: String?
    var isButtonEnabled: Bool = false
}

final class LoginViewModel: ObservableObject {
    
    @Published var state: LoginState
    
    init() {
        self.state = LoginState()
    }
    
    func updateEmail(_ value: String) {
        state.email = value
        updateButtonState()
    }
    
    func updatePassword(_ value: String) {
        state.password = value
        updateButtonState()
    }
    
    private func updateButtonState() {
        state.isButtonEnabled = isValidForm()
    }

    private func isValidForm() -> Bool {
        state.emailError = FormValidation.emailValidation(state.email)
        state.passwordError = FormValidation.passwordValidation(state.password)
        return state.emailError == nil && state.passwordError == nil
    }
    
}
