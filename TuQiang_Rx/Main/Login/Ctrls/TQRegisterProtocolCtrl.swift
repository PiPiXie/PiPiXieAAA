//
//  TQRegisterProtocolCtrl.swift
//  TuQiang_Rx
//
//  Created by XieLB on 2019/1/18.
//  Copyright © 2019年 XieLB. All rights reserved.
//

import UIKit
import SnapKit

class TQRegisterProtocolCtrl: TQBaseViewController {

    /// 内容视图
    var webView = UIWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configNavigationBar()
        configSubViews()
        layoutSubViews()
    }
    
    /// 配置导航条
    func configNavigationBar() {
        title = TQMemberCenterTitleResources.memberCenterLoginProtocol.rawValue
    }
    
    /// 配置子视图
    func configSubViews() {
        webView.loadRequest(URLRequest.init(url: URL.init(string: "https://baidu.com")!))
        webView.delegate = self
        view.addSubview(webView)
    }
    
    /// 配置子视图坐标
    func layoutSubViews() {
        webView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(0)
        }
    }
}

// MARK:- UIWebViewDelegate
extension TQRegisterProtocolCtrl: UIWebViewDelegate {
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        TQProgressHUD.showHud(state: .begin)
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        TQProgressHUD.showHud(state: .end)
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        TQProgressHUD.showHud(state: .end)
        self.navigationController?.popViewController(animated: true)
    }
}
