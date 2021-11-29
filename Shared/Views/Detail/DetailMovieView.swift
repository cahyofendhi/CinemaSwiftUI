//
//  DetailMovieView.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 25/11/21.
//

import SwiftUI

struct DetailMovieView: View {
    
    @State var tabBar: UITabBar?
    
    var body: some View {
        
        List {
            
            Text("Detail Movie")
            
        }
        .navigationTitle("Movie")
        
    }
    
    
}

struct DetailMovieView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMovieView()
    }
}
