//
//  PasswordField.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 24/01/22.
//

import SwiftUI

struct PasswordField: View {
    
    @State private var visible: Bool = false
    
    var title: String = "Password"
    @Binding var value: String
    
    var body: some View {
        
        HStack(spacing: 15){
            VStack{
                if self.visible {
                    TextField(title, text: self.$value)
                        .frame(height: 16)
                        .autocapitalization(.none)
                        .placeholder(when: value.isEmpty, placeholder: {
                            Text(L10n.usernameOrEmail)
                                .foregroundColor(.gray.opacity(0.3))
                                .descStyle()
                        })
                } else {
                    SecureField(title, text: self.$value)
                        .frame(height: 16)
                        .autocapitalization(.none)
                }
            }
            
            Button(action: {
                self.visible.toggle()
            }) {
                Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                    .opacity(0.8)
            }
            .accessibilityIdentifier("eyeButton")
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.blue.opacity(0.7),lineWidth: 2))
        .padding(.top, 10)
        
    }
    
}

struct PasswordField_Previews: PreviewProvider {
    static var previews: some View {
        PasswordField(title: "Password", value: Binding.constant(""))
    }
}
