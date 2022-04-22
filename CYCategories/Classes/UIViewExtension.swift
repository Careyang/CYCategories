//
//  UIViewExtension.swift
//  Reminder
//
//  Created by careyang on 22/4/2022.
//

import UIKit

extension UIView {

    /// 设置不同圆角
    /// - Parameters:
    ///   - corner: 圆角位置 [.topLeft, .topRight]
    ///   - cornerRadii: 圆角大小
    func setCorner(corner: UIRectCorner, cornerRadii: CGSize = CGSize(width: 4, height: 4)) {
        let bezier = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corner, cornerRadii: cornerRadii)
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.path = bezier.cgPath
        self.layer.mask = shapeLayer
    }
}
