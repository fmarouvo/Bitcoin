//
//  Double+String.swift
//  Bitcoin
//
//  Created by Fausto Castagnari Marouvo on 10/18/20.
//

import Foundation

extension Double {
    func convertToMoneyWithTwoDecimals() -> String {
        let value: NSNumber = self as NSNumber
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        let result = formatter.string(from: value) ?? ""
        return result
    }
    
    func rounded(toPlaces places:Int) -> Double {
        let doubleString = String(format: "%.\(places)f", self)
        return Double(doubleString) ?? 0
    }
}
