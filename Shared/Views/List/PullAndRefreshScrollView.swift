//
//  PullAndRefreshScrollView.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 02/02/22.
//

import Foundation
import SwiftUI


struct PullAndRefreshScrollView<Content: View>: View {
    
    let content: Content
    private var onRefresh: ()->Void
    private var onLoad: ()->Void
    var enablePullDown: Bool = false
    var enablePullUp: Bool = false
    var isloadMore: Bool
    
    init(enablePullDown: Bool = true, enablePullUp: Bool = true ,isloadMore: Bool, onRefresh: @escaping ()->Void, onLoad: @escaping ()->Void, @ViewBuilder content: () -> Content) {
        self.enablePullDown = enablePullDown
        self.enablePullUp = enablePullUp
        self.isloadMore = isloadMore
        self.onRefresh = onRefresh
        self.onLoad = onLoad
        self.content = content()
    }
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false, content: {
            if enablePullDown {
                RefreshControl(coordinateSpace: .named("RefreshControl"),
                               onRefresh: onRefresh, refresh: true)
            }
            LazyVStack(content: {
                self.content
                
                if enablePullUp && isloadMore {
                    ProgressView()
                        .onAppear {
                            self.onLoad()
                        }
                }
                
            })
        })
        .coordinateSpace(name: "RefreshControl")
        
    }
    
}



struct RefreshControl: View {
    var coordinateSpace: CoordinateSpace
    var onRefresh: ()->Void
    @State var refresh: Bool = false
    var body: some View {
        GeometryReader { geo in
            if (geo.frame(in: coordinateSpace).midY > 50) {
                Spacer()
                    .onAppear {
                        if refresh == false {
                            onRefresh() ///call refresh once if pulled more than 50px
                        }
                        refresh = true
                    }
            } else if (geo.frame(in: coordinateSpace).maxY < 1) {
                Spacer()
                    .onAppear {
                        refresh = false
                        ///reset  refresh if view shrink back
                    }
            }
            ZStack(alignment: .center) {
                if refresh { ///show loading if refresh called
                    ProgressView()
                } else { ///mimic static progress bar with filled bar to the drag percentage
                    ForEach(0..<8) { tick in
                          VStack {
                              Rectangle()
                                .fill(Color(UIColor.tertiaryLabel))
                                .opacity((Int((geo.frame(in: coordinateSpace).midY)/7) < tick) ? 0 : 1)
                                  .frame(width: 3, height: 7)
                                .cornerRadius(3)
                              Spacer()
                      }.rotationEffect(Angle.degrees(Double(tick)/(8) * 360))
                   }.frame(width: 20, height: 20, alignment: .center)
                }
            }.frame(width: geo.size.width)
        }.padding(.top, -50)
    }
}
