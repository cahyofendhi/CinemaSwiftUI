//
//  PeopleView.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 01/12/21.
//

import SwiftUI

struct PeopleView: View {
    
    var data = [1, 2, 3, 4, 5, 6, 7]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("Full Cast")
                .font(.system(size: 16))
                .foregroundColor(Color.black)
                .padding(.leading, 16)
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                
                HStack(alignment: .top, spacing: 16, content: {
                    
                    Rectangle().fill(Color.white).frame(width: 0)
                    
                    ForEach(data, id: \.self) { it in
                        
                        VStack {
                        
                            ImageView(withURL: "https://talenthouse-res.cloudinary.com/image/upload/c_limit,f_auto,fl_progressive,h_1280,w_1280/v1613767843/user-1106846/profile/fojndsvlvdjtayy11ucr.jpg",
                                mode: .fill)
                                .frame(width: UIScreen.width / 4, height: UIScreen.width / 4)
                                .cornerRadius(10)

                            Text("Charle Theron")
                                .bold()
                                .font(.system(size: 10))
                                .foregroundColor(.black)
                                .lineLimit(2)
                                
                        }
                        .frame(width: UIScreen.width / 4)
                    }
                    
                    Rectangle().fill(Color.white).frame(width: 0)
                    
                })
                
                
            })
                
        }
        
    }
    
}

struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView()
    }
}
