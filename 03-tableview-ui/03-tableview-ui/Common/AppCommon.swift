//
//  AppCommon.swift
//  02-tableview-home
//
//  Created by tomxiang on 2022/12/6.
//
import UIKit
import Reachability
import SnapKit

// MARK: - 常用距离
public let kScreen  = UIScreen.main.bounds
public let kScreenW = UIScreen.main.bounds.size.width
public let kScreenH = UIScreen.main.bounds.size.height

public let kMargin = kFitScale(at: 10)
public let kLineMargin = kFitScale(at: 1)

public let isIphoneX = { () -> Bool in
    var isX = false
    if #available(iOS 11.0, *) {
        isX = (UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0) > CGFloat(0.0)
    }
    return isX
}

public let kWindowSafeAreaInset = { () -> UIEdgeInsets in
    var insets = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    if #available(iOS 11.0, *) {
        insets = UIApplication.shared.keyWindow?.safeAreaInsets ?? insets
    }
    return insets
}

public let kSafeAreaTop = kWindowSafeAreaInset().top == 0 ? 20 : kWindowSafeAreaInset().top
public let kSafeAreaBottom = kWindowSafeAreaInset().bottom
public let kStatusH = kWindowSafeAreaInset().top
public let kNavigaH = 44 + kStatusH
public let kTabBarH = 49 + kSafeAreaBottom

// MARK: - 动画执行时间
let kDuration: TimeInterval = 3.0

// MARK: - 偏好设置存储
/// 应用是否首次启动
public let kAppLaunchUserDefaultsKey = "kAppLaunchUserDefaultsKey"
/// 应用当前语言设置
public let kAppLanguageUserDefaultsKey = "kAppLanguageUserDefaultsKey"
/// 白天夜间模式
public let kThemeSettingUserDefaultKey = "kThemeSettingUserDefaultKey"


// MARK: - FileManager Path
public let cachesURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
public let libraryURL = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask)[0]
// MARK: - 系统信息相关
let infoDictionary = Bundle.main.infoDictionary!
/// 程序名称
let appDisplayName = infoDictionary["CFBundleDisplayName"] as! String
/// 主程序版本号
let majorVersion = infoDictionary["CFBundleShortVersionString"] as! String

// MARK: - 当前窗口
let kCurrentWindow = UIApplication.shared.keyWindow

/// 设备唯一标识码
public let kDeviceUUID = { () -> String in
    if let uuid = UIDevice.current.identifierForVendor?.uuidString {
        return uuid
    }
    return ""
}

// MARK: - 屏幕适配375 | 6s尺寸
func kFitScale(at ratio: CGFloat) -> CGFloat {
    return (UIScreen.main.bounds.width / 375) * ratio
}

// MARK: - 朋友圈
let mImageW = (kScreenW - 156) / 3

// MARK:- 颜色方法
func normalRGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}
func RGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor (red: r, green: g, blue: b, alpha: a)
}

// MARK:- 常用按钮颜色
let kBtnWhite = RGBA(r: 0.97, g: 0.97, b: 0.97, a: 1.00)
let kBtnDisabledWhite = RGBA(r: 0.97, g: 0.97, b: 0.97, a: 0.30)
let kBtnGreen = RGBA(r: 0.15, g: 0.67, b: 0.16, a: 1.00)
let kBtnDisabledGreen = RGBA(r: 0.65, g: 0.87, b: 0.65, a: 1.00)
let kBtnRed = RGBA(r: 0.89, g: 0.27, b: 0.27, a: 1.00)
// 分割线颜色
let kSplitLineColor = RGBA(r: 0.78, g: 0.78, b: 0.80, a: 1.00)
// 常规背景颜色
let kCommonBgColor = RGBA(r: 0.92, g: 0.92, b: 0.92, a: 1.00)
let kSectionColor = RGBA(r: 0.94, g: 0.94, b: 0.96, a: 1.00)
// 导航栏背景颜色
let kNavBarBgColor = normalRGBA(r: 20, g: 20, b: 20, a: 0.9)

// 表情键盘颜色大全
let kChatBoxColor = normalRGBA(r: 244.0, g: 244.0, b: 246.0, a: 1.0)
let kLineGrayColor = normalRGBA(r: 188.0, g: 188.0, b: 188.0, a: 0.6)

// TABBar颜色
let kTabbarColor = RGBA(r: 0.95, g: 0.95, b: 0.95, a: 1.00)

