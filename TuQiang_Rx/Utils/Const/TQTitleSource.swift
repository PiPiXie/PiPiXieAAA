//
//  TQTitleSource.swift
//  TuQiang_Rx
//
//  Created by XieLB on 2019/1/17.
//  Copyright © 2019年 XieLB. All rights reserved.
//

import Foundation


// 文字资源
enum TQMemberCenterTitleResources: String {
    
    case memberCenterNetworkFailure = "网络异常"
    case memberCenterDataFailure = "数据异常"
    case memberCenterLogin = "登录"
    case memberCenterPersonUser = "个人用户"
    case memberCenterCompanyUser = "企业用户"
    case memberCenterForgetPassword = "忘记密码"
    case memberCenterLoginPrompt = "点击登录即代表您已阅读并接受"
    case memberCenterLoginProtocol = "《注册用户使用协议》"
    case memberCenterSendCode = "发送验证码"
    case memberCenterInputPhone = "请填写手机号"
    case memberCenterInputCompanyAccount = "请填写企业帐号"
    case memberCenterInputMessageCode = "请填写短信验证码"
    case memberCenterInputPassword = "请输入密码"
    case memberCenterFindPassword = "找回密码"
    case memberCenterNextStep = "下一步"
    case memberCenterResetPassword = "重置密码"
    case memberCenterResetPrompt1 = "您正在重置"
    case memberCenterResetPrompt2 = "帐号（"
    case memberCenterResetPrompt3 = "）的登录密码"
    case memberCenterInputNewPassword = "请输入6-16位新密码"
    case memberCenterSure = "确定"
    case memberCenterResetSuccessPrompt = "重置密码成功，请登录"
    case memberCenterBackLoginCtrl = "返回登录页"
    case memberCenterInputRightPhone = "请输入正确的手机号码"
    case memberCenterInputCode = "请输入验证码"
    case memberCenterCodeError = "验证码错误"
    case memberCenterInputAcount = "请输入帐号"
    
    
    case none = ""
}


enum TQMemberCenterRequestUrlString: String {
    
    case getPhoneCode = "/app/user/getPhoneCode"    //获取手机验证码
    case login = "/oauth/token"     //用户登录
    case checkPhoneCode = "/app/user/checkPhoneCode"    //检查手机号码与验证码是否对应
    case resetPwd = "/app/user/resetPwd"    //重置密码
    case getUserInfo = "/app/user/getUserInfo"  //获取个人资料
    
    
    case none = ""
}
