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

    public func setUI(title: String? = nil, titleColor: UIColor, font: UIFont, bgColor: UIColor? = nil, bgImage: UIImage? = nil) {
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = font
        setBackgroundImage(bgImage, for: .normal)
        backgroundColor = bgColor
        layer.masksToBounds = true
    }

    public func setBoarder(borderWidth: CGFloat?, borderColor: UIColor?, cornerRadius: CGFloat?) {
        // 打开光栅化，减少GPU负担
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        layer.masksToBounds = true
        if let bw = borderWidth {
            layer.borderWidth = bw
        }
        if let cr = cornerRadius {
            layer.cornerRadius = cr
        }
        layer.borderColor = borderColor?.cgColor
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

public typealias ButtonAction = (UIButton) -> Void

extension UIButton {
    private struct AssociatedKeys {
        static var actionKey = UnsafeRawPointer.init(bitPattern: "actionKey".hashValue)
    }

    @objc dynamic var action: ButtonAction? {
        get {
            if let action = objc_getAssociatedObject(self, &AssociatedKeys.actionKey) as? ButtonAction {
                return action
            }
            return nil
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.actionKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY)
        }
    }
    /// 添加一个点击事件
    /// - Parameter action: 点击时执行的闭包
    @discardableResult // 消除未使用返回值时的警告
    public func addClickAction(action: @escaping ButtonAction) -> UIButton {
        return self.addEvent(event: .touchUpInside, action: action)
    }
    @discardableResult // 消除未使用返回值时的警告
    public func addEvent(event: UIControl.Event, action:@escaping  ButtonAction ) -> UIButton {
        self.action = action
        self.addTarget(self, action: #selector(buttonEventAction), for: event)
        return self
    }
    @objc func buttonEventAction(button: UIButton) {
        if let action = self.action {
            action(button)
        }
    }
}
