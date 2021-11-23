//
//  ContentView.swift
//  Shared
//
//  Created by Dot Indonesia on 23/11/21.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = .white
    }
    
    var body: some View {
        TabView {
            Text("Home").tabItem {
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 5, content: {
                    Image("ic_home")
                    Text("Home")
                })
            }.tag(0)
            
            Text("Search").tabItem {
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
