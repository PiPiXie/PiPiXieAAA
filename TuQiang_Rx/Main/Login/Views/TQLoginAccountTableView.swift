//
//  TQLoginAccountTableView.swift
//  TuQiang_Rx
//
//  Created by XieLB on 2019/1/17.
//  Copyright © 2019年 XieLB. All rights reserved.
//

import UIKit

class TQLoginAccountTableView: UITableView {

    /// 保存帐号key
    static private let TQSaveAccountKey = "saveAccountKey"
    /// cell标识
    private let TQMemberCenterMoudleAccountCellId = "TQMemberCenterMoudleAccountCell"
    
    /// 数据数组(内为字典)
    var datas: [[String: String]] = [[String: String]]() {
        didSet {
            reloadData()
        }
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.separatorStyle = .none
        self.backgroundColor = UIColor.clear
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.delegate = self
        self.dataSource = self
        self.register(TQMemberCenterMoudleAccountCell.self, forCellReuseIdentifier: TQMemberCenterMoudleAccountCellId)
        self.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK:- UITableViewDataSource And UITableViewDelegate
extension TQLoginAccountTableView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TQMemberCenterMoudleAccountCellId) as? TQMemberCenterMoudleAccountCell
        cell?.accountLabel.text = datas[indexPath.row]["account"]
//        cell?.deleteCloser = { [weak self] str in
//            self?.deleteAccount(account: str)
//        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


class TQMemberCenterMoudleAccountCell: UITableViewCell {
    
    /// 输入框
    var accountLabel = UILabel()
    /// 删除按钮
    var deleteBtn = UIButton.init(type: .custom)
    /// 下方线段
    var lineView = UIView()
//    /// 删除回调
//    var deleteCloser: MemberCenterReturnStringClosure?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configSubViews()
        layoutSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func configSubViews() {
        
        backgroundColor = UIColor.clear
        contentView.backgroundColor = UIColor.clear
        selectionStyle = .none
        
        /// 手机号
        accountLabel.font = UIFont.systemFont(ofSize: 15)
        accountLabel.textColor = UIColor.hexString("0x313131")
        contentView.addSubview(accountLabel)
        
        /// 删除按钮
        deleteBtn.setImage(UIImage.init(named: "login_delete_icon"), for: .normal)
        deleteBtn.addTarget(self, action: #selector(didDeleteAction), for: .touchUpInside)
        contentView.addSubview(deleteBtn)
        
        /// 下方线段
        lineView.backgroundColor = UIColor.hexString("0xE1E1E1")
        contentView.addSubview(lineView)
    }
    
    func layoutSubViews() {
        
        lineView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.bottom.equalTo(0)
            make.height.equalTo(0.5)
        }
        deleteBtn.snp.makeConstraints { (make) in
            make.right.equalTo(12)
            make.width.equalTo(46)
            make.bottom.equalTo(lineView.snp.bottom).offset(0)
            make.height.equalTo(45)
        }
        accountLabel.snp.makeConstraints { (make) in
            make.left.equalTo(26)
            make.centerY.equalTo(deleteBtn.snp.centerY)
            make.height.equalTo(40)
            make.right.equalTo(deleteBtn.snp.left)
        }
    }
    
    /// 点击删除按钮
    @objc func didDeleteAction() {
//        if deleteCloser != nil {
//            deleteCloser!(accountLabel.text ?? "")
//        }
    }
}
