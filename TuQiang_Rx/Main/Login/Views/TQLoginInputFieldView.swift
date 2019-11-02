//
//  TQLoginInputFieldView.swift
//  TuQiang_Rx
//
//  Created by XieLB on 2019/1/17.
//  Copyright © 2019年 XieLB. All rights reserved.
//

import UIKit
import SnapKit

/// cell类型枚举
enum TQLoginInputType {
    case phone          //手机号（带验证码）
    case companyAccount //企业帐号（带下拉框）
    case code           //验证码
    case password       //密码
}

class TQLoginInputFieldView: TQBaseView {

    /// 图标
    var imageView = UIImageView()
    /// 输入框
    var textField = UITextField()
    /// 发送验证码按钮
    var sendCodeBtn = TQCodeButton.init()
    /// 下拉箭头
    var rowBtn = UIButton.init(type: .custom)
    /// 下方线段
    var lineView = UIView()
//    /// 获取验证码回调
//    var didCodeCloser: TQReturnClosure?
//    /// 下拉帐号回调
//    var didRowCloser: TQReturnBoolClosure?
    
    init(type: TQLoginInputType) {
        super.init(frame: CGRect.zero)
        configSubViews()
        layoutSubViews()
        inputType = type
        refreshView(type: inputType)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configSubViews() {
        
        /// 帐号手机号图标
        addSubview(imageView)
        
        /// 帐号手机号输入框
        textField.clearButtonMode = .whileEditing
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.textColor = UIColor.hexString("0x313131")
        addSubview(textField)
        
        /// 发送验证码按钮
        sendCodeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        sendCodeBtn.setTitle(TQMemberCenterTitleResources.memberCenterSendCode.rawValue, for: .normal)
        sendCodeBtn.setTitleColor(UIColor.hexString("0x4CB4A5"), for: .normal)
//        sendCodeBtn.addTarget(self, action: #selector(didSendCodeAction), for: .touchUpInside)
        addSubview(sendCodeBtn)
        
        /// 下拉箭头
        let rowImage = UIImage.init(named: "login_more_icon")
        rowBtn.setImage(rowImage, for: .normal)
//        rowBtn.addTarget(self, action: #selector(didRowAction), for: .touchUpInside)
        addSubview(rowBtn)
        
        /// 帐号下方线段
        lineView.backgroundColor = UIColor.hexString("0xE1E1E1")
        addSubview(lineView)
    }
    
    func layoutSubViews() {
        
        lineView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.bottom.equalTo(0)
            make.height.equalTo(0.5)
        }
        imageView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.bottom.equalTo(lineView.snp.bottom).offset(-15)
            make.width.equalTo(17)
            make.height.equalTo(18)
        }
        sendCodeBtn.snp.makeConstraints { (make) in
            make.right.equalTo(0)
            make.centerY.equalTo(imageView.snp.centerY)
            make.height.equalTo(45)
            make.width.equalTo(85)
        }
        rowBtn.snp.makeConstraints { (make) in
            make.right.equalTo(12)
            make.width.equalTo(46)
            make.centerY.equalTo(imageView.snp.centerY)
            make.height.equalTo(45)
        }
    }
    
    /// 登录类型
    var inputType = TQLoginInputType.phone {
        didSet {
            refreshView(type: inputType)
        }
    }
    
    /// 刷新视图
    func refreshView(type: TQLoginInputType) {
        sendCodeBtn.isHidden = true
        rowBtn.isHidden = true
        rowBtn.isSelected = false
        textField.text = ""
        textField.isSecureTextEntry = false
        textField.snp.removeConstraints()
        textField.snp.makeConstraints { (make) in
            make.left.equalTo(imageView.snp.right).offset(9)
            make.centerY.equalTo(imageView.snp.centerY)
            make.height.equalTo(40)
            make.right.equalTo(0)
        }
        
        switch type {
        case .phone:
            imageView.image = UIImage.init(named: "login_admin")
            sendCodeBtn.isHidden = false
            textField.keyboardType = .numberPad
            textField.placeholder = TQMemberCenterTitleResources.memberCenterInputPhone.rawValue
            textField.snp.removeConstraints()
            textField.snp.makeConstraints { (make) in
                make.left.equalTo(imageView.snp.right).offset(9)
                make.centerY.equalTo(imageView.snp.centerY)
                make.height.equalTo(40)
                make.right.equalTo(sendCodeBtn.snp.left)
            }
        case .companyAccount:
            imageView.image = UIImage.init(named: "login_admin")
            rowBtn.isHidden = false
            textField.keyboardType = .default
            textField.placeholder = TQMemberCenterTitleResources.memberCenterInputCompanyAccount.rawValue
            textField.snp.removeConstraints()
            textField.snp.makeConstraints { (make) in
                make.left.equalTo(imageView.snp.right).offset(9)
                make.centerY.equalTo(imageView.snp.centerY)
                make.height.equalTo(40)
                make.right.equalTo(rowBtn.snp.left)
            }
        case .code:
            imageView.image = UIImage.init(named: "login_code")
            textField.keyboardType = .numberPad
            textField.placeholder = TQMemberCenterTitleResources.memberCenterInputMessageCode.rawValue
        case .password:
            imageView.image = UIImage.init(named: "login_code")
            textField.isSecureTextEntry = true
            textField.keyboardType = .default
            textField.placeholder = TQMemberCenterTitleResources.memberCenterInputPassword.rawValue
        }
    }
    
//    /// 点击发送验证码
//    @objc func didSendCodeAction(_ sender: Any) {
//        if didCodeCloser != nil {
//            didCodeCloser!()
//        }
//    }
//
//    /// 点击下拉帐号
//    @objc func didRowAction(_ sender: Any) {
//        rowSelectedState = !rowSelectedState
//        if didRowCloser != nil {
//            didRowCloser!(rowSelectedState)
//        }
//    }
//
    /// 下拉按钮点击状态
    var rowSelectedState: Bool = false {
        didSet {
            let transform = CGAffineTransform(rotationAngle: rowSelectedState ? CGFloat.pi : 0)
            rowBtn.transform = transform
        }
    }
}
