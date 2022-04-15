//
//  ArrayExtension.swift
//  Reminder
//
//  Created by careyang on 15/4/2022.
//

import Foundation
import UIKit

extension Array {
    
    public subscript (safe index: Int?) -> Element? {
         guard let index = index else { return nil }
         return indices ~= index ? self[index] : nil
     }

}
