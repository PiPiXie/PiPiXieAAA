//
//  TQUserManager.swift
//  TuQiang_Rx
//
//  Created by XieLB on 2019/1/16.
//  Copyright © 2019年 XieLB. All rights reserved.
//

import Foundation

class TQUserManager: NSObject {
    
    static let sharedInstance = TQUserManager()
    
    private override init() {}
    
    /// 登录状态
    var isLogin = false
    /// 登录数据
    var loginModel: TQLoginDataModel?
    /// 用户数据
    var userModel: TQUserDataModel?
}
