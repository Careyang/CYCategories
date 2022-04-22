//
//  UIButtonExtension.swift
//  Reminder
//
//  Created by careyang on 15/4/2022.
//

import UIKit

extension UIButton {

    public convenience init(title: String? = nil, titleColor: UIColor? = nil, font: UIFont? = nil, titleEdge: UIEdgeInsets? = nil, image: UIImage? = nil, imageEdge: UIEdgeInsets? = nil, bgImage: UIImage? = nil, bgColor: UIColor? = nil, edge: UIEdgeInsets? = nil, borderWidth: CGFloat? = nil, borderColor: UIColor? = nil, cornerRadius: CGFloat? = nil) {
        self.init()
        title.flatMap { setTitle($0, for: .normal) }
        titleColor.flatMap { setTitleColor($0, for: .normal) }
        titleEdge.flatMap { titleEdgeInsets = $0 }
        font.flatMap { titleLabel?.font = $0 }
        image.flatMap { setImage($0, for: .normal) }
        imageEdge.flatMap { imageEdgeInsets = $0 }
        bgImage.flatMap { setBackgroundImage($0, for: .normal) }
        bgColor.flatMap { backgroundColor = $0 }
        edge.flatMap { contentEdgeInsets = $0 }
        borderWidth.flatMap { layer.borderWidth = $0 }
        borderColor.flatMap { layer.borderColor = $0.cgColor }
        cornerRadius.flatMap {
            layer.cornerRadius = $0
            layer.masksToBounds = true
        }
    }

    public func setUI(title: String? = nil, titleColor: UIColor, font: UIFont, bgColor: UIColor? = nil, bgImage: UIImage? = nil, borderWidth: CGFloat? = nil, borderColor: UIColor? = nil, cornerRadius: CGFloat = 0) {
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = font
        setBackgroundImage(bgImage, for: .normal)
        backgroundColor = bgColor
        if let bw = borderWidth {
            layer.borderWidth = bw
        }
        if let bc = borderColor {
            layer.borderColor = bc.cgColor
        }
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }

    public func hidden(_ isHidden: Bool) -> UIButton {
        self.isHidden = isHidden
        return self
    }

    public func enable(_ isEnable: Bool) -> UIButton {
        self.isEnabled = isEnable
        return self
    }
}
