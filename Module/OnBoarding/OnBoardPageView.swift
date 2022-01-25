//
//  OnBoardPageView.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Rumah Ulya on 25/01/22.
//

import SwiftUI

struct OnBoardPageView: View {
    
    @Binding var isFirst: Bool
    
    let pages: [OnBoard] = OnBoard.data()
    
    @State private var currentPage = 0
    
    var body: some View {
        
        VStack {
            
            TabView(selection: $currentPage, content: {
                ForEach (0 ..< self.pages.count) { index in
                    OnBoardView(page: self.pages[index])
                        .tag(index)
                        .padding()
                }
            })
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            HStack {
                PageControl(numberOfPages: pages.count, currentPageIndex: $currentPage, onChange: { index in
                    self.currentPage = index
                })
                    .frame(width: 100, height: 50, alignment: .center)
                Spacer()
                Button(action: {
                    withAnimation (.easeInOut(duration: 1.0)) {
                        if self.currentPage == 3 {
                            isFirst = false
                        } else {
                            self.currentPage = (self.currentPage + 1)%self.pages.count
                        }
                   }
                }, label: {
                    CircleButton()
                })
            }
            .padding()
            
        }
        
    }
    
}

struct CircleButton: View {
    
    var body: some View {
        Image(systemName: "arrow.right")
            .foregroundColor(Color.white)
            .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
            .background(Circle().fill(Color.blue))
            
            
    }
    
}

struct OnBoardPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardPageView(isFirst: Binding.constant(true))
    }
}
