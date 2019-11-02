//
//  TQDefineTool.swift
//  TuQiang_Rx
//
//  Created by XieLB on 2019/1/17.
//  Copyright © 2019年 XieLB. All rights reserved.
//

import Foundation
import UIKit

typealias TQReturnClosure = () -> Void
typealias TQReturnStringClosure = (String) -> Void
typealias TQReturnIntClosure = (Int) -> Void
typealias TQReturnCGFloatClosure = (CGFloat) -> Void
typealias TQReturnBoolClosure = (Bool) -> Void
typealias TQReturnAnyClosure = (Any) -> Void

/// 屏幕宽
let TQScreenWidth = UIScreen.main.bounds.size.width
/// 屏幕高
let TQScreenHeight = UIScreen.main.bounds.size.height
/// 设备是X系列
let TQIsIphoneX = (TQScreenWidth == 812.0  ||  TQScreenHeight == 896.0)
/// 电池条高度
let TQStatusBarHeight = TQIsIphoneX ? CGFloat(44.0) : CGFloat(20.0)
/// 导航栏+电池条高度
let TQNavigationBarHeight = TQStatusBarHeight + CGFloat(44.0)
/// iPhoneX下方高度
let TQHomeIndicatorHeight = TQIsIphoneX ? CGFloat(34.0) : CGFloat(0.0)
/// 去除上下方高度后剩余高度
let TQContentHeight = TQScreenHeight - TQNavigationBarHeight - TQHomeIndicatorHeight
/// tabbar高度
let TQTabbarHeight = CGFloat(49.0)

func FitSize(_ size: CGFloat) -> CGFloat {
    return TQScreenWidth * size / 375.0
}
