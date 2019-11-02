//
//  TQLoginViewModel.swift
//  TuQiang_Rx
//
//  Created by XieLB on 2019/1/17.
//  Copyright © 2019年 XieLB. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TQLoginViewModel: TQBaseViewModel {
    
    /// 输入事件
    struct TQLoginInput {
        let personTap: Observable<Void>     //个人用户点击
        let companyTap: Observable<Void>    //企业用户点击
        let phone: Observable<String>       //手机号输入
        let code: Observable<String>        //验证码输入
        let account: Observable<String>     //帐号输入
        let password: Observable<String>    //密码输入
        let sendCodeTap: Observable<Void>   //发送验证码点击
        let rowBtnTap: Observable<Void>     //历史帐号点击
        let loginTap: Observable<Void>      //登录点击
        let forgetPasswordTap: Observable<Void> //忘记密码点击
        let promptTap: Observable<Void>     //注册协议点击
    }
    
    /// 输出事件
    struct TQLoginOutput {
        let loginTypeStatus = Variable<TQLoginType>(.person)        //用户方式
        let accountDatas = Variable<[[String: String]]>.init([])    //历史帐号数据
        let showAccountTableView = Variable<Bool>.init(false)       //显示历史帐号列表
        let selectAccount = Variable<[String: String]>.init([:])    //选择历史帐号
        let getCodeSuccess = Variable<Bool>.init(false)             //登录成功
    }
    
    var input: TQLoginInput!
    
    var output: TQLoginOutput!
    
    
    init(input: TQLoginInput) {
        super.init()
        
        self.input = input
        output = TQLoginOutput()
        
        input.personTap.subscribe(onNext: { [weak self] _ in
            self?.output.showAccountTableView.value = false
            self?.output.loginTypeStatus.value = .person
        }).disposed(by: rx_disposeBag)
        
        input.companyTap.subscribe(onNext: { [weak self] _ in
            self?.output.loginTypeStatus.value = .company
        }).disposed(by: rx_disposeBag)
        
        input.sendCodeTap.withLatestFrom(input.phone).subscribe(onNext: { [weak self] str in
            self?.requestGetPhoneCode(phoneStr: str)
        }).disposed(by: rx_disposeBag)
        
        let loginParam: Observable<(String, String, String, String)> = Observable.combineLatest(input.phone, input.code, input.account, input.password) { (phone, code, account, password) -> (String, String, String, String) in
            return (phone, code, account, password)
        }
        input.loginTap.withLatestFrom(loginParam).subscribe(onNext: { [weak self] (phone, code, account, password) in
            self?.requestLogin(phone: phone, code: code, account: account, password: password)
        }).disposed(by: rx_disposeBag)
        
        input.rowBtnTap.subscribe(onNext: { [weak self] _ in
            self?.output.showAccountTableView.value = !(self?.output.showAccountTableView.value ?? false)
        }).disposed(by: rx_disposeBag)
    }
    
    private let TQSaveAccountKey = "saveAccountKey"
    
    /// 配置初始信息
    func config() {
        output.loginTypeStatus.value = .person
        output.accountDatas.value = UserDefaults.standard.object(forKey: TQSaveAccountKey) as? [[String: String]] ?? [[String: String]]()
    }
    
    /// 获取短信验证码请求
    func requestGetPhoneCode(phoneStr: String) {
        
        if !phoneStr.validatePhoneNumber() {
            TQProgressHUD.showHud(state: .info, content: TQMemberCenterTitleResources.memberCenterInputRightPhone.rawValue)
            return
        }
        
        let parameters = [
            "phone": phoneStr
            ] as [String : Any]
        TQProgressHUD.showHud(state: .begin)
        _ = tqNetTool.rx.request(.parameter(type: .getPhoneCode, parameters: parameters)).asObservable().mapObject(TQResponseBaseModel.self).subscribe({ [weak self] (event) in
            switch event {
            case let .next(model):
                print("\(model)")
                if model.code == 0 {
                    TQProgressHUD.showHud(state: .end)
                    TQProgressHUD.showHud(state: .info, content: model.data)
                    self?.output.getCodeSuccess.value = true
                }else {
                    TQProgressHUD.showHud(state: .failure, content: model.message)
                }
                break
            case .error(_):
                TQProgressHUD.showHud(state: .failure, content: TQMemberCenterTitleResources.memberCenterNetworkFailure.rawValue)
                break
            case .completed:
                break
            }
        })
    }
    
    /// 登录请求
    func requestLogin(phone: String, code: String, account: String, password: String) {
        var parameters = [String : Any]()
        if output.loginTypeStatus.value == .person {
            parameters.updateValue("pin", forKey: "grant_type")
            parameters.updateValue(phone, forKey: "phone")
            parameters.updateValue(code, forKey: "code")
        }else {
            parameters.updateValue("password", forKey: "grant_type")
            parameters.updateValue(account, forKey: "username")
            parameters.updateValue(password.md5(), forKey: "password")
        }
        TQProgressHUD.showHud(state: .begin)
        _ = tqNetTool.rx.request(.parameter(type: .login, parameters: parameters)).asObservable().mapObject(TQLoginModel.self).subscribe({ [weak self] (event) in
            switch event {
            case let .next(model):
                print("\(model)")
                if model.code == 0 {
                    TQUserManager.sharedInstance.loginModel = model.data
                    TQUserManager.sharedInstance.isLogin = true
                    if self?.output.loginTypeStatus.value == .company {
                        self?.addAccount(dic: ["account": account, "password":password])
                    }
                    self?.requestGetUserInfo()
                }else {
                    TQProgressHUD.showHud(state: .failure, content: model.message)
                }
                break
            case .error(_):
                TQProgressHUD.showHud(state: .failure, content: TQMemberCenterTitleResources.memberCenterNetworkFailure.rawValue)
                break
            case .completed:
                break
            }
        })
    }
    
    /// 获取用户信息
    func requestGetUserInfo() {
        
        _ = tqNetTool.rx.request(.parameter(type: .getUserInfo, parameters: [ : ])).asObservable().mapObject(TQUserModel.self).subscribe({ (event) in
            switch event {
            case let .next(model):
                print("\(model)")
                if model.code == 0 {
                    TQProgressHUD.showHud(state: .end)
                    TQUserManager.sharedInstance.userModel = model.data
                    appDelegate.window?.rootViewController = TQTabBarViewController()
                }else {
                    TQProgressHUD.showHud(state: .failure, content: model.message)
                }
                break
            case .error(_):
                TQProgressHUD.showHud(state: .failure, content: TQMemberCenterTitleResources.memberCenterNetworkFailure.rawValue)
                break
            case .completed:
                break
            }
        })
    }
    
    /// 登录成功，增加帐号到记录中
    func addAccount(dic: [String: String]) {
        /// 遍历，如果该帐号在记录中，移除记录中的
        for index in 0..<output.accountDatas.value.count {
            let data = output.accountDatas.value[index]
            if data["account"] == dic["account"] {
                output.accountDatas.value.remove(at: index)
                break
            }
        }
        /// 如果原记录等于10,移除最后一个
        if output.accountDatas.value.count == 10 {
            output.accountDatas.value.removeLast()
        }
        output.accountDatas.value.append(dic)
        UserDefaults.standard.set(output.accountDatas.value as Any, forKey:TQSaveAccountKey)
        UserDefaults.standard.synchronize()
    }
    
    /// 删除指定帐号
    func deleteAccount(account: String) {
        /// 遍历，如果该帐号在记录中，移除记录中的
        for index in 0..<output.accountDatas.value.count {
            let data = output.accountDatas.value[index]
            if data["account"] == account {
                output.accountDatas.value.remove(at: index)
                break
            }
        }
        UserDefaults.standard.set(output.accountDatas.value as Any, forKey:TQSaveAccountKey)
        UserDefaults.standard.synchronize()
    }
}
