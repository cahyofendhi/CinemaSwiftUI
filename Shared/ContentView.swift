//
//  ContentView.swift
//  Shared
//
//  Created by Dot Indonesia on 23/11/21.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().barTintColor = .white
        UIToolbar.appearance().barTintColor = UIColor.red
    }
    
    var body: some View {
        TabView {
            HomeView().tabItem {
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 5, content: {
                    Image("ic_home")
                    Text("Home")
                })
            }.tag(0)
            
            TVView().tabItem {
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 5, content: {
                    Image("ic_search")
                    Text("Search")
                })
            }.tag(1)
        }
        .accentColor(.red)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
