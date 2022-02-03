//
//  CinemaSwiftUIApp.swift
//  Shared
//
//  Created by Dot Indonesia on 23/11/21.
//

import SwiftUI

@main
struct CinemaSwiftUIApp: App {
    
    @State var isLoggedin: Bool = SessionData.getData(type: Bool.self, forKey: .isLogin) ?? false
    @State var isFirst: Bool = SessionData.getData(type: Bool.self, forKey: .isIntro) ?? true
      
    var body: some Scene {
        WindowGroup {
            if isFirst {
                OnBoardPageView(isFirst: $isFirst)
            } else {
                if isLoggedin {
                    ContentView()
                } else {
                    LoginView(isLoggedin: $isLoggedin)
                }
            }
        }
    }
}
