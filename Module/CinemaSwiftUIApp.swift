//
//  CinemaSwiftUIApp.swift
//  Shared
//
//  Created by Dot Indonesia on 23/11/21.
//

import SwiftUI

@main
struct CinemaSwiftUIApp: App {
    
    @State var isLoggedin: Bool = false
    @State var isFirst: Bool = true
        
    var body: some Scene {
        WindowGroup {
            ContentView()
//            if isFirst {
//                OnBoardPageView(isFirst: $isFirst)
//            } else {
//                if isLoggedin {
//                    ContentView()
//                } else {
//                    LoginView(isLoggedin: $isLoggedin)
//                }
//            }
        }
    }
}
