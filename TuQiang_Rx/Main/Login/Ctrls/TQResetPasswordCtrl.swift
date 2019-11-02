//
//  TQResetPasswordCtrl.swift
//  TuQiang_Rx
//
//  Created by XieLB on 2019/1/22.
//  Copyright © 2019年 XieLB. All rights reserved.
//

import UIKit

class TQResetPasswordCtrl: TQBaseViewController {

    /// 手机号（由上级界面传入）
    var phone: String = ""
    /// 验证码（由上级界面传入）
    var code: String = ""
    /// 提示文本
    var promptLabel: UILabel = { () -> UILabel in
        let label = UILabel.init()
        label.textColor = UIColor.hexString("0x666666")
        label.font = UIFont.systemFont(ofSize: FitSize(14.0))
        return label
    }()
    /// 密码
    var passwordInputView: TQLoginInputFieldView = { () -> TQLoginInputFieldView in
        let view = TQLoginInputFieldView.init(type: .password)
        view.textField.placeholder = TQMemberCenterTitleResources.memberCenterInputNewPassword.rawValue
        return view
    }()
    /// 确定按钮
    let nextBtn: UIButton = { () -> UIButton in
        let btn = UIButton.init(type: .custom)
        let mainColor = UIColor.hexString("0x4CB4A5")
        btn.backgroundColor = mainColor
        btn.setTitle(TQMemberCenterTitleResources.memberCenterSure.rawValue, for: .normal)
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
        title = TQMemberCenterTitleResources.memberCenterResetPassword.rawValue
    }
    
    /// 配置子视图
    func configSubViews() {
        
        /// 提示语
        view.addSubview(promptLabel)
        /// 密码
        view.addSubview(passwordInputView)
        /// 确定按钮
        view.addSubview(nextBtn)
        
        nextBtn.addTarget(self, action: #selector(didSureAction), for: .touchUpInside)
        promptLabel.text = TQMemberCenterTitleResources.memberCenterResetPrompt1.rawValue
            + "aaa"
            + TQMemberCenterTitleResources.memberCenterResetPrompt2.rawValue
            + "13411112222"
            + TQMemberCenterTitleResources.memberCenterResetPrompt3.rawValue
    }
    
    /// 配置子视图坐标
    func layoutSubViews() {
        
        passwordInputView.snp.makeConstraints { (make) in
            make.left.equalTo(25)
            make.centerY.equalToSuperview().offset(-TQNavigationBarHeight/2)
            make.right.equalTo(-25)
            make.height.equalTo(18)
        }
        promptLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(passwordInputView.snp.top).offset(FitSize(-56))
            make.height.equalTo(20)
        }
        nextBtn.snp.makeConstraints { (make) in
            make.left.equalTo(25)
            make.right.equalTo(-25)
            make.top.equalTo(passwordInputView.snp.bottom).offset(78)
            make.height.equalTo(45)
        }
    }
    
    /// 点击确定事件
    @objc func didSureAction() {
        
//        CTMediator.sharedInstance()?.tq_popupShowHud(state: .begin, content: "")
//        TQMemberCenterMoudleNetworkTool.requestResetPwd(phone: phone, code: code, newPwd: passwordInputView.textField.text, requestCallback: { [weak self] (dic, data, any) in
//
//            guard let code = dic?["code"] as? Int else {
//                CTMediator.sharedInstance()?.tq_popupShowHud(state: .failure,
//                                                             content: TQMemberCenterTitleResources.memberCenterDataFailure.rawValue)
//                return
//            }
//            if code == 0 {
//                CTMediator.sharedInstance()?.tq_popupShowHud(state: .end, content: "")
//                print("\(String(describing: dic))")
//                let ctrl = TQMemberCenterMoudleResetSuccessViewController()
//                self?.navigationController?.pushViewController(ctrl, animated: true)
//                self?.navigationController?.navigationBar.isHidden = true
//            }else {
//                CTMediator.sharedInstance()?.tq_popupShowHud(state: .failure, content: dic?["message"] as? String ?? "")
//            }
//        })
    }
}
