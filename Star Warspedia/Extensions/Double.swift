//
//  Double.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 1/10/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import Foundation

private let ten: Double = 10
private let thousand: Double = 1000
private let _100Thousand: Double = 100000
private let _10Million: Double = 10_000_0000
private let million: Double = 1_000_000
private let billion: Double = 1_000_000_000
private let _100Billion: Double = 100_000_000_000
private let trillion: Double = 1_000_000_000_000

extension Double {
    
    var convertedToShortString: String {
        var convertedValue: String
        var num: Double = 0
        if self < thousand {
            convertedValue = "\(self)"
        } else if self < million {
            num = (self / 100) / ten
            convertedValue = String(format: "%.0fK", num) // Thousand
        } else if self < billion {
            num = (self / _100Thousand) / ten
            convertedValue = String(format: "%.0fM", num) // Million
        } else if self < trillion {
            num = (self / _10Million) / ten
            convertedValue = String(format: "%.0fB", num) // Billion
        } else {
            num = (self / _100Billion) / ten
            convertedValue = String(format: "%.0fT", num) // Trillion
        }
        return convertedValue
    }

    // days to year
    var daysToYear: String {
        if self > 364 {
            let str = String(format: "%.2f", ceil((self / 365) * 100) / 100)
            return "\(str) Years"
        }
        return "\(self) Days"
    }
}
