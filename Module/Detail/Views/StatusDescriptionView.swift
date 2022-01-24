//
//  StatusDescriptionView.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 01/12/21.
//

import SwiftUI

struct StatusDescriptionView: View {
    
    var title: String = "Title"
    var description: String = ""
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 5) {
            Text(title)
                .font(.system(size: 12))
                .foregroundColor(Color.black)
            
            Text(description)
                .font(.system(size: 12))
                .foregroundColor(Color.gray)
        }
        
    }
}

struct StatusDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        StatusDescriptionView()
    }
}
