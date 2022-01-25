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
        
    var body: some Scene {
        WindowGroup {
            if isLoggedin {
                ContentView()
            } else {
                LoginView(isLoggedin: $isLoggedin)
            }
        }
    }
}
