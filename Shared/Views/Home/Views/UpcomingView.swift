//
//  UpcomingView.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 23/11/21.
//

import SwiftUI

struct UpcomingView: View {
    
    var data = [1, 2, 3, 4, 5, 6, 7, 8]
    
    var body: some View {
        ACarousel(data,
                  id: \.self,
                  spacing: 30,
                  headspace: 10,
                  sidesScaling: 0.85,
                  isWrap: false) { item in
            
            VStack(alignment: .center, spacing: 16, content: {
                Text("Title \(item)")
                Text("Description \(item)")
            })
            .frame(
                  minWidth: 0,
                  maxWidth: .infinity,
                  minHeight: 0,
                  maxHeight: .infinity,
                  alignment: .topLeading
                )
            .background(Color.gray)
            .shadow(radius: 10)
            .cornerRadius(10)
        }
        .frame(height: 100)
    }
}

struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingView()
    }
}
