//
//  Int+Ex.swift
//  SportApp
//
//  Created by Max Khizhniakov on 20.01.2021.
//

import Foundation

extension Int {
    static func toTime(_ interval: Int, formatter: DateComponentsFormatter) -> String {
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional

        var result = formatter.string(from: TimeInterval(interval))!
        if result.count == 1  { result = "0:0\(result)" }
        if result.count == 2 { result = "0:\(result)" }
        return result
    }
}
