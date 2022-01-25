//
//  OnBoardModel.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Rumah Ulya on 25/01/22.
//

import Foundation

struct OnBoard {
    
    let image: String
    let title: String
    let description: String
    
    
    static func data() -> [OnBoard] {
        return [
            OnBoard(image: "onboard_1", title: "Onboard Page 1", description: "Description onboard page 1"),
            OnBoard(image: "onboard_2", title: "Onboard Page 2", description: "Description onboard page 2"),
            OnBoard(image: "onboard_3", title: "Onboard Page 3", description: "Description onboard page 3"),
            OnBoard(image: "onboard_4", title: "Onboard Page 4", description: "Description onboard page 4"),
        ]
    }
    
}
