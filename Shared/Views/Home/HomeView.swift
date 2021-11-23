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
                ForEach(self.datas, id: \.self) { it in
                    Text("\(it)")
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Home")
                    }
                    .foregroundColor(.black)
                    .frame(width: .infinity, height: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
            })
//            .navigationBarTitleDisplayMode(.inline)
//                    .toolbar { // <2>
//                        ToolbarItem(placement: .principal) { // <3>
//                            VStack {
//                                Text("Title").font(.headline)
//                                Text("Subtitle").font(.subheadline)
//                            }
//                        }
//                    }
            
        }
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
