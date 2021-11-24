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
            
            ZStack() {
                ImageView(withURL: "https://talenthouse-res.cloudinary.com/image/upload/c_limit,f_auto,fl_progressive,h_1280,w_1280/v1613767843/user-1106846/profile/fojndsvlvdjtayy11ucr.jpg",
                    mode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                VStack {
                    Spacer()
                    HStack {
                        VStack(alignment: .leading, spacing: 5){
                            Text("Pump Action Interaction")
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                            Text("While you can always go for a simplified title sequence for the opening of your flick, it may be the film's benefit to splurge ")
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                        }
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 5))
                        Spacer()
                    }.background(
                        LinearGradient(
                            gradient: Gradient(
                                colors: [.gray.opacity(0.5), .black.opacity(0.5)]),
                            startPoint: .top, endPoint: .bottom)
                    )
                }
                .padding(.bottom, 0)
            }
            .frame(
                  minWidth: 0,
                  maxWidth: .infinity,
                  minHeight: 0,
                  maxHeight: .infinity,
                  alignment: .topLeading
                )
            .shadow(radius: 10)
            .cornerRadius(10)
        }
        .frame(height: 150)
    }
}

struct UpcomingView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingView()
    }
}
