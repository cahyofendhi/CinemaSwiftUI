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
        UIToolbar.appearance().barTintColor = UIColor.blue
    }
    
    @State var tabSelection: Tabs = .home
    
    var body: some View {
        TabView(selection: $tabSelection) {
            HomeView().tabItem {
                VStack(alignment: .center, spacing: 5, content: {
                    Image("ic_home")
                    Text("Home")
                })
            }.tag(Tabs.home)
            
            TVView().tabItem {
                VStack(alignment: .center, spacing: 5, content: {
                    Image("ic_search")
                    Text("Search")
                })
            }.tag(Tabs.tv)
        }
        .accentColor(.blue)
    }
    
    enum Tabs {
        case home, tv
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
