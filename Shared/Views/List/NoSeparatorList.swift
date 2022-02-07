//
//  NoSeparatorList.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 29/11/21.
//

import SwiftUI

struct NoSepratorList<Content>: View where Content: View {

    let content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
        
    }
        
    var body: some View {
        if #available(iOS 14.0, *) {
            ScrollView(showsIndicators: false, content: {
                LazyVStack(spacing: 0) {
                 self.content()
                }
            })
        } else {
            List {
                self.content()
            }
            .onAppear {
                UITableView.appearance().separatorStyle = .none
                UITableView.appearance().showsVerticalScrollIndicator = false
            }.onDisappear {
               UITableView.appearance().separatorStyle = .singleLine
            }
        }
    }
}
