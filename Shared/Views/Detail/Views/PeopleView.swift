//
//  PeopleView.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 01/12/21.
//

import SwiftUI

struct PeopleView: View {
    
    var crews: [People]?
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("Full Cast")
                .font(.system(size: 16))
                .foregroundColor(Color.black)
                .padding(.leading, 16)
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                
                HStack(alignment: .top, spacing: 16, content: {
                    
                    Rectangle().fill(Color.white).frame(width: 0)
                    
                    ForEach(crews ?? [], id: \.self) { it in
                        
                        VStack {
                        
                            ImageView(withURL: it.getImageProfile(),
                                mode: .fill)
                                .frame(width: UIScreen.width / 4, height: UIScreen.width / 4)
                                .cornerRadius(10)

                            Text(it.name ?? "")
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
