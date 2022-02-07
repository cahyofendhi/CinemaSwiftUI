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
    var loading: Bool = false
    
    init(enablePullDown: Bool = true,
         enablePullUp: Bool = true,
         loading: Bool = true,
         isloadMore: Bool,
         onRefresh: @escaping ()->Void,
         onLoad: @escaping ()->Void,
         @ViewBuilder content: () -> Content) {
        self.enablePullDown = enablePullDown
        self.enablePullUp = enablePullUp
        self.isloadMore = isloadMore
        self.onRefresh = onRefresh
        self.onLoad = onLoad
        self.content = content()
        self.loading = loading
    }
    
    var body: some View {
        
        GeometryReader { geo in
            
            ScrollView(.vertical, showsIndicators: false, content: {
                if enablePullDown {
                    RefreshControl(coordinateSpace: .named("RefreshControl"), loading: loading)
                        .padding(.top, loading ? 0 : -20)
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
                .anchorPreference(key: OffsetPreferenceKey.self, value: .top) {
                    return geo[$0].y
                }
            })
            .coordinateSpace(name: "RefreshControl")
            .onPreferenceChange(OffsetPreferenceKey.self) { offset in
                if offset > 50 {
                   onRefresh()
                }
            }
        }
    }
    
}

fileprivate struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}


fileprivate struct RefreshControl: View {
    var coordinateSpace: CoordinateSpace
    @State var refresh: Bool = false
    var loading: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            if (geo.frame(in: coordinateSpace).midY > 50) {
                Spacer()
                    .onAppear {
                        refresh = true
                    }
            } else if (geo.frame(in: coordinateSpace).maxY < 1) {
                Spacer()
                    .onAppear {
                        refresh = false
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
        }
        .padding(.top, loading && refresh ? 0 : -20)
        .padding(.bottom, 20)
    }
}
