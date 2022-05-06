//
//  DateExtension.swift
//  Reminder
//
//  Created by careyang on 29/4/2022.
//

import Foundation

extension DateFormatter {

    /// yyyy-MM
    /// - Parameter time: 时间字符串
    /// - Returns: Date
    static func dateFromYM(time: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM"
        return formatter.date(from: time)
    }

    /// yyyy-MM-dd
    /// - Parameter time: 时间字符串
    /// - Returns: Date
    static func dateFromYMD(time: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: time)
    }

    /// yyyy-MM-dd HH:mm
    /// - Parameter time: 时间
    /// - Returns: Date
    static func dateFromYMDHm(time: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return formatter.date(from: time)
    }

}
