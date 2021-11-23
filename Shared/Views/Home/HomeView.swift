//
//  HomeView.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 23/11/21.
//

import SwiftUI

struct HomeView: View {
    
    var datas = [1, 2, 3, 4, 5, 6, 7]
    
    var body: some View {
        
        NavigationView {
            
            List {
                UpcomingView().listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            .listRowInsets(.none)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Home")
                    }
                    .foregroundColor(.black)
                }
            })
            
        }
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
