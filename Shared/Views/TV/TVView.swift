//
//  TVView.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 25/11/21.
//

import SwiftUI

struct TVView: View {
    
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                HStack {
                    Text("TV Movie")
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                        .bold()
                        .padding(.leading, 16)
                    
                    Spacer()
                    
                    Button(action: {
                        print("Click")
                    }, label: {
                        Image("ic_search")
                    })
                    .padding(.trailing, 16)
                    
                    
                }
                .hideRowSeparator()
                
                TVVideoView()
                    .hideRowSeparator()
                
                TVTopRateView(title: "Popular")
                    .hideRowSeparator()
                    .padding(.top, 16)
                
                TVTopRateView(title: "Top Rate")
                    .hideRowSeparator()
                    .padding(.top, 16)
                
            }
            .listRowBackground(Color.white)
            .listRowInsets(.none)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .onAppear() {
                UITableView.appearance().showsVerticalScrollIndicator = false
            }
        }
        
    }
    
}

struct TVView_Previews: PreviewProvider {
    static var previews: some View {
        TVView()
    }
}
