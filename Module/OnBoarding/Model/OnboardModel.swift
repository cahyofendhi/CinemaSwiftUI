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
            OnBoard(image: Asset.Assets.onboard1.name, title: L10n.intro1Title, description: L10n.intro1Description),
            OnBoard(image: Asset.Assets.onboard2.name, title: L10n.intro2Title, description: L10n.intro2Description),
            OnBoard(image: Asset.Assets.onboard3.name, title: L10n.intro3Title, description: L10n.intro3Description),
            OnBoard(image: Asset.Assets.onboard4.name, title: L10n.intro4Title, description: L10n.intro4Description),
        ]
    }
    
}
