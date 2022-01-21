//
//  DoubleExtension.swift
//  CinemaSwiftUI (iOS)
//
//  Created by Dot Indonesia on 20/01/22.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    func toCurrency() -> String  {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current 
        formatter.numberStyle = .currency
        if let formattedTipAmount = formatter.string(from: self as NSNumber) {
            return formattedTipAmount
        } else {
            return "\(self)"
        }
    }
    
}
