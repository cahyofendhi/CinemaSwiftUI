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
    
    var body: some View {
    
        NavigationView {
        
            VStack(alignment: .center, spacing: 0, content: {
                Text("Login")
                    .font(.title)
                    .foregroundColor(Color.black)
                
                TextField("Username or Email",text: .init(
                    get: { [viewmodel] in viewmodel.state.email },
                    set: { [viewmodel] in viewmodel.updateEmail($0) }
                ))
                    .autocapitalization(.none)
                    .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
                    .background(RoundedRectangle(cornerRadius:6).stroke(Color.blue.opacity(0.7),lineWidth:2))
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
                
                PasswordField(title: "Password", value: .init(
                    get: { [viewmodel] in viewmodel.state.password },
                    set: { [viewmodel] in viewmodel.updatePassword($0) }
                ))
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
                
                Button(action: {
                    isLoggedin = true
                }) {
                    Text("Submit")
                        .fontWeight(.light)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50, alignment: .center)
                .background(viewmodel.state.isButtonEnabled ? Color.blue : Color.blue.opacity(0.5))
                .cornerRadius(10)
                .padding(.top, 50)
                .padding(.leading, 16)
                .padding(.trailing, 16)
                .disabled(!viewmodel.state.isButtonEnabled)
                
                Spacer()
                    
                
            })
        }
        
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isLoggedin: Binding.constant(false))
    }
}
