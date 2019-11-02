//
//  TQLoginCtrl.swift
//  TuQiang_Rx
//
//  Created by XieLB on 2019/1/17.
//  Copyright © 2019年 XieLB. All rights reserved.
//

import UIKit

/// 登录类型枚举
enum TQLoginType {
    case person     //个人用户
    case company    //企业用户
}


class TQLoginCtrl: TQBaseViewController {

    /// 上方背景
    let topBgImageView: UIImageView = { () -> UIImageView in
        let imageView = UIImageView.init()
        imageView.image = UIImage.init(named: "login_bg1")
        return imageView
    }()
    /// 下方背景
    let bottomBgImageView: UIImageView = { () -> UIImageView in
        let imageView = UIImageView.init()
        imageView.image = UIImage.init(named: "login_bg2")
        return imageView
    }()
    /// 头部icon
    let headerImageView: UIImageView = { () -> UIImageView in
        let imageView = UIImageView.init()
        imageView.image = UIImage.init(named: "login_logo")
        return imageView
    }()
    /// 个人用户按钮
    let personBtn: UIButton = { () -> UIButton in
        let btn = UIButton.init(type: .custom)
        let mainColor = UIColor.hexString("0x4CB4A5")
        let blackColor = UIColor.hexString("0x313131")
        btn.setTitle(TQMemberCenterTitleResources.memberCenterPersonUser.rawValue, for: .normal)
        btn.setTitleColor(blackColor, for: .normal)
        btn.setTitleColor(mainColor, for: .selected)
        btn.isSelected = true
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        return btn
    }()
    /// 企业用户按钮
    let companyBtn: UIButton = { () -> UIButton in
        let btn = UIButton.init(type: .custom)
        let mainColor = UIColor.hexString("0x4CB4A5")
        let blackColor = UIColor.hexString("0x313131")
        btn.setTitle(TQMemberCenterTitleResources.memberCenterCompanyUser.rawValue, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        btn.setTitleColor(blackColor, for: .normal)
        btn.setTitleColor(mainColor, for: .selected)
        return btn
    }()
    /// 个人用户按钮线条
    let personLineView: UIView = { () -> UIView in
        let view = UIView.init()
        let mainColor = UIColor.hexString("0x4CB4A5")
        view.backgroundColor = mainColor
        return view
    }()
    /// 企业用户按钮线条
    let companyLineView: UIView = { () -> UIView in
        let view = UIView.init()
        let mainColor = UIColor.hexString("0x4CB4A5")
        view.isHidden = true
        view.backgroundColor = mainColor
        return view
    }()
    /// 个人用户手机号
    var phoneInputView = TQLoginInputFieldView.init(type: .phone)
    /// 个人用户短信验证码
    var codeInputView = TQLoginInputFieldView.init(type: .code)
    /// 企业用户帐号
    var accountInputView: TQLoginInputFieldView = { () -> TQLoginInputFieldView in
        let view = TQLoginInputFieldView.init(type: .companyAccount)
        view.isHidden = true
        return view
    }()
    /// 企业用户密码
    var passwordInputView: TQLoginInputFieldView = { () -> TQLoginInputFieldView in
        let view = TQLoginInputFieldView.init(type: .password)
        view.isHidden = true
        return view
    }()
    /// 历史帐号表视图
    var accountTableView: TQLoginAccountTableView = { () -> TQLoginAccountTableView in
        let view = TQLoginAccountTableView.init(frame: CGRect.zero, style: .plain)
        view.isHidden = true
        return view
    }()
    /// 登录按钮
    let loginBtn: UIButton = { () -> UIButton in
        let btn = UIButton.init(type: .custom)
        let mainColor = UIColor.hexString("0x4CB4A5")
        btn.backgroundColor = mainColor
        btn.setTitle(TQMemberCenterTitleResources.memberCenterLogin.rawValue, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
        btn.layer.cornerRadius = 22.5
        btn.layer.masksToBounds = true
        return btn
    }()
    /// 忘记密码按钮
    let forgetPasswordBtn: UIButton = { () -> UIButton in
        let btn = UIButton.init(type: .custom)
        btn.setTitle(TQMemberCenterTitleResources.memberCenterForgetPassword.rawValue, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        let titleColor = UIColor.hexString("0x4CB4A5")
        btn.setTitleColor(titleColor, for: .normal)
        btn.isHidden = true
        return btn
    }()
    /// 下方协议视图
    let promptView = UIView.init()
    /// 协议文本
    let promptLabel: UILabel = { () -> UILabel in
        let label = UILabel.init()
        let textColor = UIColor.hexString("0x313131")
        label.textColor = textColor
        label.text = TQMemberCenterTitleResources.memberCenterLoginPrompt.rawValue
        label.font = UIFont.systemFont(ofSize: FitSize(12.0))
        return label
    }()
    /// 协议按钮
    let promptBtn: UIButton = { () -> UIButton in
        let mainColor = UIColor.hexString("0x4CB4A5")
        let btn = UIButton.init(type: .custom)
        btn.setTitle(TQMemberCenterTitleResources.memberCenterLoginProtocol.rawValue, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: FitSize(12.0))
        btn.setTitleColor(mainColor, for: .normal)
        return btn
    }()
    /// 
    var viewModel: TQLoginViewModel!
    
    
    // MARK:- 生命周期方法
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configNavigationBar()
        configSubViews()
        configViewModel()
        layoutSubViews()
        
        // test
        phoneInputView.textField.text = "13400001111"
        accountInputView.textField.text = "jimitest"
        passwordInputView.textField.text = "123456"
    }
    
    /// 配置导航条
    func configNavigationBar() {
        
    }
    
    /// 配置子视图
    func configSubViews() {
        
        view.backgroundColor = UIColor.white
        view.addSubview(topBgImageView)
        view.addSubview(bottomBgImageView)
        view.addSubview(headerImageView)
        view.addSubview(personBtn)
        view.addSubview(companyBtn)
        view.addSubview(personLineView)
        view.addSubview(companyLineView)
        view.addSubview(phoneInputView)
        view.addSubview(codeInputView)
        view.addSubview(accountInputView)
        view.addSubview(passwordInputView)
        view.addSubview(accountTableView)
        view.addSubview(loginBtn)
        view.addSubview(forgetPasswordBtn)
        view.addSubview(promptView)
        promptView.addSubview(promptLabel)
        promptView.addSubview(promptBtn)
    }
    
    /// 配置ViewModel
    func configViewModel() {
        viewModel = TQLoginViewModel.init(input: TQLoginViewModel.TQLoginInput(
            personTap: personBtn.rx.tap.asObservable(),
            companyTap: companyBtn.rx.tap.asObservable(),
            phone: phoneInputView.textField.rx.text.orEmpty.asObservable(),
            code: codeInputView.textField.rx.text.orEmpty.asObservable(),
            account: accountInputView.textField.rx.text.orEmpty.asObservable(),
            password: passwordInputView.textField.rx.text.orEmpty.asObservable(),
            sendCodeTap: phoneInputView.sendCodeBtn.rx.tap.asObservable(),
            rowBtnTap: accountInputView.rowBtn.rx.tap.asObservable(),
            loginTap: loginBtn.rx.tap.asObservable(),
            forgetPasswordTap: forgetPasswordBtn.rx.tap.asObservable(),
            promptTap: promptBtn.rx.tap.asObservable()
        ))
        
        viewModel.output.loginTypeStatus.asObservable().subscribe(onNext: { [weak self] (type) in
            self?.refreshUIWithChangeLoginType(type)
        }).disposed(by: rx_disposeBag)
        
        viewModel.output.accountDatas.asObservable().subscribe(onNext: { [weak self] (datas) in
            self?.accountTableView.datas = datas
            self?.accountInputView.rowBtn.isHidden = (datas.count == 0)
        }).disposed(by: rx_disposeBag)
        
        
        viewModel.output.showAccountTableView.asObservable().subscribe(onNext: { [weak self] (bool) in
            self?.changeAccountTableState(bool)
        }).disposed(by: rx_disposeBag)
        
        viewModel.output.getCodeSuccess.asObservable().subscribe(onNext: { [weak self] (bool) in
            if bool {
                self?.phoneInputView.sendCodeBtn.startCountDown()
            }
        }).disposed(by: rx_disposeBag)
        
        viewModel.config()
    }
    
    /// 配置子视图坐标
    func layoutSubViews() {
        
        /// 上方背景
        topBgImageView.snp.makeConstraints { (make) in
            make.top.equalTo(TQStatusBarHeight-40)
            make.height.width.equalTo(FitSize(703.0/2))
            make.centerX.equalToSuperview()
        }
        /// 下方背景
        bottomBgImageView.snp.makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.left.right.equalTo(0)
            make.height.equalTo(FitSize(205))
        }
        /// 头部icon
        headerImageView.snp.makeConstraints { (make) in
            make.top.equalTo(FitSize(78)+TQStatusBarHeight)
            make.centerX.equalToSuperview()
            make.height.equalTo(FitSize(84))
            make.width.equalTo(FitSize(71))
        }
        /// 个人用户按钮
        personBtn.snp.makeConstraints { (make) in
            make.top.equalTo(headerImageView.snp.bottom).offset(FitSize(30))
            make.right.equalTo(-TQScreenWidth/2)
            make.width.equalTo(64+67)
            make.height.equalTo(40)
        }
        /// 企业用户按钮
        companyBtn.snp.makeConstraints { (make) in
            make.top.equalTo(personBtn.snp.top)
            make.left.equalTo(personBtn.snp.right)
            make.width.equalTo(personBtn.snp.width)
            make.height.equalTo(personBtn.snp.height)
        }
        /// 个人用户按钮线条
        personLineView.snp.makeConstraints { (make) in
            make.top.equalTo(personBtn.snp.bottom)
            make.centerX.equalTo(personBtn.snp.centerX)
            make.width.equalTo(70)
            make.height.equalTo(1)
        }
        /// 企业用户按钮线条
        companyLineView.snp.makeConstraints { (make) in
            make.top.equalTo(companyBtn.snp.bottom)
            make.centerX.equalTo(companyBtn.snp.centerX)
            make.width.equalTo(70)
            make.height.equalTo(1)
        }
        /// 个人用户手机号
        phoneInputView.snp.makeConstraints { (make) in
            make.left.equalTo(25)
            make.right.equalTo(-25)
            make.top.equalTo(personBtn.snp.bottom).offset(FitSize(45))
            make.height.equalTo(50)
        }
        /// 个人用户短信验证码
        codeInputView.snp.makeConstraints({ (make) in
            make.left.right.equalTo(phoneInputView)
            make.top.equalTo(phoneInputView.snp.bottom)
            make.height.equalTo(65)
        })
        /// 企业用户帐号
        accountInputView.snp.makeConstraints { (make) in
            make.left.right.top.height.equalTo(phoneInputView)
        }
        /// 企业用户密码
        passwordInputView.snp.makeConstraints { (make) in
            make.left.right.top.height.equalTo(codeInputView)
        }
        /// 历史帐号表视图
        accountTableView.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(passwordInputView)
            make.height.equalTo(45*4-1)
        }
        /// 登录按钮
        loginBtn.snp.makeConstraints { (make) in
            make.left.equalTo(25)
            make.right.equalTo(-25)
            make.top.equalTo(codeInputView.snp.bottom).offset(40)
            make.height.equalTo(45)
        }
        /// 忘记密码按钮
        forgetPasswordBtn.snp.makeConstraints { (make) in
            make.top.equalTo(loginBtn.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        /// 下方协议视图
        promptView.snp.makeConstraints { (make) in
            make.bottom.equalTo(-25)
            make.height.equalTo(17)
            make.centerX.equalToSuperview()
        }
        /// 协议文本
        promptLabel.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.bottom.equalTo(0)
        }
        /// 协议按钮
        promptBtn.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(promptLabel.snp.right)
            make.bottom.equalTo(0)
            make.right.equalTo(0)
        }
    }
    
    
    /// 根据当前登录类型刷新UI
    ///
    /// - Parameter loginType: 登录类型
    func refreshUIWithChangeLoginType(_ loginType: TQLoginType) {
        if loginType == .person {
            personLineView.isHidden = false
            companyLineView.isHidden = true
            personBtn.isSelected = true
            companyBtn.isSelected = false
            forgetPasswordBtn.isHidden = true
            promptView.isHidden = false
            phoneInputView.isHidden = false
            codeInputView.isHidden = false
            accountInputView.isHidden = true
            passwordInputView.isHidden = true
        } else {
            personLineView.isHidden = true
            companyLineView.isHidden = false
            personBtn.isSelected = false
            companyBtn.isSelected = true
            forgetPasswordBtn.isHidden = false
            promptView.isHidden = true
            phoneInputView.isHidden = true
            codeInputView.isHidden = true
            accountInputView.isHidden = false
            passwordInputView.isHidden = false
        }
    }
    
    /// 刷新表视图显示状态
    func changeAccountTableState(_ state: Bool) {
        accountInputView.rowSelectedState = state
        passwordInputView.isHidden = state
        loginBtn.isHidden = state
        forgetPasswordBtn.isHidden = state
        accountTableView.isHidden = !state
    }
}
