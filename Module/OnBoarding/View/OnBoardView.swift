//
//  OnBoardView.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Rumah Ulya on 25/01/22.
//

import SwiftUI


struct OnBoardView: View {
    
    let page: OnBoard
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Image(self.page.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
            
            Group {
                
                HStack {
                    Text(self.page.title)
                        .titleStyle(size: 20)
                    
                    Spacer()
                }
                
                HStack {
                    Text(self.page.description)
                        .descStyle(size: 18)
                    Spacer()
                }
                .padding(.top, 12)
                
            }
            
        }
        .padding()
        
    }
    
}



struct IntroPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardView(page: OnBoard(image: "onboard_1", title: "Title", description: "Description"))
    }
}
