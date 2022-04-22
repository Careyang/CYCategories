//
//  UILabelExtension.swift
//  Reminder
//
//  Created by careyang on 15/4/2022.
//

import UIKit

extension UILabel {


    public convenience init(text: String? = nil, size: CGFloat, weight: UIFont.Weight, color: UIColor? = nil, alignment: NSTextAlignment = .left) {
        self.init(text: text, font: UIFont.systemFont(ofSize: size, weight: weight), color: color, alignment: alignment)
    }

    public convenience init(text: String? = nil, font: UIFont, color: UIColor? = nil, alignment: NSTextAlignment = .left) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        color.flatMap {
            self.textColor = $0
        }
        self.textAlignment = alignment
    }

    public convenience init(attr: NSAttributedString) {
        self.init(frame: .zero)
        self.attributedText = attr
    }

    public func setUI(text: String? = nil, color: UIColor, font: UIFont, alignment: NSTextAlignment = .left) {
        self.text = text
        self.font = font
        self.textColor = color
        self.textAlignment = alignment
    }

    public func setAttributedString(text: String?, font: UIFont? = nil, color: UIColor? = nil, lineSpace: CGFloat = 0, paragraphSpacing: CGFloat = 0) {
        guard let text = text else { return }
        let p = NSMutableParagraphStyle()
        p.lineSpacing = lineSpace
        p.paragraphSpacing = paragraphSpacing
        p.lineBreakMode = self.lineBreakMode
        p.alignment = self.textAlignment
        let attr = NSMutableAttributedString(
            string: text,
            attributes: [.font: font ?? self.font!,
                         .foregroundColor: color ?? self.textColor!,
                         .paragraphStyle: p
                        ])
        self.attributedText = attr
    }
}
