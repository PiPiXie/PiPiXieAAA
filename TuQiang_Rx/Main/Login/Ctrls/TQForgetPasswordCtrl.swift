//
//  TQForgetPasswordCtrl.swift
//  TuQiang_Rx
//
//  Created by XieLB on 2019/1/23.
//  Copyright © 2019年 XieLB. All rights reserved.
//

import UIKit

class TQForgetPasswordCtrl: TQBaseViewController {

    /// 手机号
    var phoneInputView = TQLoginInputFieldView.init(type: .phone)
    /// 短信验证码
    var codeInputView = TQLoginInputFieldView.init(type: .code)
    /// 下一步按钮
    let nextBtn: UIButton = { () -> UIButton in
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = UIColor.hexString("0x4CB4A5")
        btn.setTitle(TQMemberCenterTitleResources.memberCenterNextStep.rawValue, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
        btn.layer.cornerRadius = 22.5
        btn.layer.masksToBounds = true
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        configNavigationBar()
        configSubViews()
        layoutSubViews()
    }
    
    /// 配置导航条
    func configNavigationBar() {
        title = TQMemberCenterTitleResources.memberCenterFindPassword.rawValue
    }
    
    /// 配置子视图
    func configSubViews() {
        
        /// 个人用户手机号
        view.addSubview(phoneInputView)
        /// 个人用户短信验证码
        view.addSubview(codeInputView)
        /// 下一步按钮
        view.addSubview(nextBtn)
        
        nextBtn.addTarget(self, action: #selector(didNextStepAction), for: .touchUpInside)
    }
    
    /// 配置子视图坐标
    func layoutSubViews() {
        
        /// 手机号
        phoneInputView.snp.makeConstraints { (make) in
            make.left.equalTo(25)
            make.right.equalTo(-25)
            make.centerY.equalToSuperview().offset(-40)
            make.height.equalTo(50)
        }
        /// 短信验证码
        codeInputView.snp.makeConstraints({ (make) in
            make.left.right.equalTo(phoneInputView)
            make.top.equalTo(phoneInputView.snp.bottom)
            make.height.equalTo(65)
        })
        /// 下一步按钮
        nextBtn.snp.makeConstraints { (make) in
            make.left.equalTo(25)
            make.right.equalTo(-25)
            make.top.equalTo(codeInputView.snp.bottom).offset(40)
            make.height.equalTo(45)
        }
    }
    
    /// 获取短信验证码请求
    func requestGetMessageCode() {
        
//        //检测手机号，验证码
//        let phone = phoneInputView.textField.text ?? ""
//        if CTMediator.sharedInstance()?.tq_toolValidatePhoneNumber(phoneNumber: phone) == false {
//            CTMediator.sharedInstance()?.tq_popupShowHud(state: .info, content: TQMemberCenterTitleResources.memberCenterInputRightPhone.rawValue)
//            return
//        }
//
//        CTMediator.sharedInstance()?.tq_popupShowHud(state: .begin, content: "")
//        TQMemberCenterMoudleNetworkTool.requestGetPhoneCode(phone: phone, requestCallback: { [weak self] (dic, data, any) in
//
//            guard let code = dic?["code"] as? Int else {
//                CTMediator.sharedInstance()?.tq_popupShowHud(state: .failure,
//                                                             content: TQMemberCenterTitleResources.memberCenterDataFailure.rawValue)
//                return
//            }
//            if code == 0 {
//                CTMediator.sharedInstance()?.tq_popupShowHud(state: .end, content: "")
//                CTMediator.sharedInstance()?.tq_baseUIStartCountDown(btn: self?.phoneInputView.sendCodeBtn)
//                print("\(String(describing: dic))")
//                print("\(String(describing: dic))")
//            }else {
//                CTMediator.sharedInstance()?.tq_popupShowHud(state: .failure, content: dic?["message"] as? String ?? "")
//            }
//        })
    }
    
    /// 点击下一步事件
    @objc func didNextStepAction() {
        
//        /// 检查输入文本合法性
//        if chectInputText() == false {
//            return
//        }
//
//        let phone = phoneInputView.textField.text ?? ""
//        let messageCode = codeInputView.textField.text ?? ""
//        CTMediator.sharedInstance()?.tq_popupShowHud(state: .begin, content: "")
//        TQMemberCenterMoudleNetworkTool.requestCheckPhoneCode(phone: phone, code: messageCode, requestCallback: { [weak self] (dic, data, any) in
//
//            guard let code = dic?["code"] as? Int else {
//                CTMediator.sharedInstance()?.tq_popupShowHud(state: .failure,
//                                                             content: TQMemberCenterTitleResources.memberCenterDataFailure.rawValue)
//                return
//            }
//            if code == 0 {
//                CTMediator.sharedInstance()?.tq_popupShowHud(state: .end, content: "")
//                print("\(String(describing: dic))")
//                let ctrl = TQMemberCenterMoudleResetPasswordViewController()
//                ctrl.phone = phone
//                ctrl.code = messageCode
//                self?.navigationController?.pushViewController(ctrl, animated: true)
//            }else {
//                CTMediator.sharedInstance()?.tq_popupShowHud(state: .failure, content: dic?["message"] as? String ?? "")
//            }
//        })
    }
    
    /// 检查输入文本合法性
    func chectInputText() -> Bool {
        
//        //检测手机号，验证码
//        let phone = phoneInputView.textField.text ?? ""
//        if CTMediator.sharedInstance()?.tq_toolValidatePhoneNumber(phoneNumber: phone) == false {
//            CTMediator.sharedInstance()?.tq_popupShowHud(state: .info, content: TQMemberCenterTitleResources.memberCenterInputRightPhone.rawValue)
//            return false
//        }
//        let code = codeInputView.textField.text ?? ""
//        if code.count == 0 {
//            CTMediator.sharedInstance()?.tq_popupShowHud(state: .info, content: TQMemberCenterTitleResources.memberCenterInputCode.rawValue)
//            return false
//        }
//        //        if code.count != 6 {
//        //            CTMediator.sharedInstance()?.tq_popupShowHud(state: .info, content: TQMemberCenterTitleResources.memberCenterCodeError.rawValue)
//        //            return false
//        //        }
        return true
    }

}

