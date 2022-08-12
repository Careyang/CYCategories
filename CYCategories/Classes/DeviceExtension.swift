//
//  UIDeviceExtension.swift
//  Reminder
//
//  Created by careyang on 15/4/2022.
//

import UIKit

/// 对于设备信息的扩展
extension UIDevice {

    /// 获取状态栏的高度
    static func cy_statusBarHeight() -> CGFloat {
        var statusBarHeight: CGFloat = 0
        if #available(iOS 13, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else { return 0 }
            guard let statusBarManager = windowScene.statusBarManager else { return 0 }
            statusBarHeight = statusBarManager.statusBarFrame.height
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        }
        return statusBarHeight
    }
    /// 顶部安全区高度
    static func cy_safeDistanceTop() -> CGFloat {
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else { return 0 }
            guard let window = windowScene.windows.first else { return 0 }
            return window.safeAreaInsets.top
        } else if #available(iOS 11.0, *) {
            guard let window = UIApplication.shared.windows.first else { return 0 }
            return window.safeAreaInsets.top
        }
        return 0
    }
    /// 底部安全区高度
    static func cy_safeDistanceBottom() -> CGFloat {
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else { return 0 }
            guard let window = windowScene.windows.first else { return 0 }
            return window.safeAreaInsets.bottom
        } else if #available(iOS 11.0, *) {
            guard let window = UIApplication.shared.windows.first else { return 0 }
            return window.safeAreaInsets.bottom
        }
        return 0
    }
    /// 导航栏高度
    static func cy_navigationBarHeight() -> CGFloat {
        return 44.0
    }
    /// 底部导航栏高度
    static func cy_tabBarHeight() -> CGFloat {
        return 49.0
    }
    /// 状态栏+导航栏的高度
    static func cy_navigationFullHeight() -> CGFloat {
        return UIDevice.cy_statusBarHeight() + UIDevice.cy_navigationBarHeight()
    }
    /// 获取屏幕宽度
    static func cy_screenWidth() -> CGFloat {
        return UIScreen.main.bounds.size.width
    }
    /// 获取屏幕高度
    static func cy_screenHeight() -> CGFloat {
        return UIScreen.main.bounds.size.height
    }
}
