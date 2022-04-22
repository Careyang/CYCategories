//
//  StringExtension.swift
//  Reminder
//
//  Created by careyang on 21/4/2022.
//

import UIKit


extension String {
    /// 如果字符串为空，当做 nil 处理
    var nilIfEmpty: String? {
        self.isEmpty ? nil : self
    }
    /// 字符串是否是空字符串(过滤空格和换行符)
    var isBlank: Bool {
        let trimmedStr = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedStr.isEmpty
    }
    /// 移除空格换行符
    var removeWhiteSpaces:String? {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
