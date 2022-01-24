//
//  ScreenUtil.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 24/01/22.
//

import Foundation
import SwiftUI

struct ScreenUtil {
    
    static func isIphone() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
}
