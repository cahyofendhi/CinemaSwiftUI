//
//  LoginView.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 24/01/22.
//

import SwiftUI

struct LoginView: View {
    
    @Binding var isLoggedin: Bool
    
    @ObservedObject private var viewmodel = LoginViewModel()
    
    @State private var showDialog = true
    @State private var isLoading = false
    
    var body: some View {
    
        NavigationView {
        
            VStack(alignment: .center, spacing: 0, content: {
                Text(L10n.login)
                    .titleStyle(size: 18)
                
                TextField(L10n.usernameOrEmail,text: .init(
                    get: { [viewmodel] in viewmodel.state.email },
                    set: { [viewmodel] in viewmodel.updateEmail($0) }
                ))
                    .placeholder(when: viewmodel.state.email.isEmpty, placeholder: {
                        Text(L10n.usernameOrEmail)
                            .foregroundColor(.gray.opacity(0.3))
                            .descStyle()
                    })
                    .standartStyle()
                    .autocapitalization(.none)
                    .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
                    .background(RoundedRectangle(cornerRadius:6).stroke(Color.blue.opacity(0.7),lineWidth:2))
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
                
                PasswordField(title: L10n.password, value: .init(
                    get: { [viewmodel] in viewmodel.state.password },
                    set: { [viewmodel] in viewmodel.updatePassword($0) }
                ))
                    .standartStyle()
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
                
                Button(action: {
                    isLoading = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        self.isLoading = false
                    }
                }) {
                    Text(L10n.submit)
                        .foregroundColor(.white)
                        .standartStyle()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50, alignment: .center)
                .background(viewmodel.state.isButtonEnabled ? Color.blue : Color.blue.opacity(0.5))
                .cornerRadius(10)
                .padding(.top, 50)
                .padding(.leading, 16)
                .padding(.trailing, 16)
                .disabled(!viewmodel.state.isButtonEnabled)
                .accessibilityIdentifier("loginButton")
                
                Spacer()
                    
                
            })
        }.showLoading($isLoading) {
            isLoggedin = true
            SessionData.setData(value: true, key: .isLogin)
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isLoggedin: Binding.constant(false))
    }
}
