//
//  TQProgressHUD.swift
//  TuQiang_Rx
//
//  Created by XieLB on 2019/1/17.
//  Copyright © 2019年 XieLB. All rights reserved.
//

import Foundation
import SVProgressHUD

public enum TQLodingStateType: String {
    case begin
    case end
    case info
    case success
    case failure
}

class TQProgressHUD {
    
    class func showHud(state: TQLodingStateType, content: String = "") -> Void  {
        SVProgressHUD.setDefaultStyle(.dark)
        SVProgressHUD.setMaximumDismissTimeInterval(1.0)
        switch state {
        case .begin:
            SVProgressHUD.show()
        case .info:
            SVProgressHUD.showInfo(withStatus: content)
        case .success:
            SVProgressHUD.showSuccess(withStatus: content)
        case .failure:
            SVProgressHUD.showError(withStatus: content)
        case .end:
            SVProgressHUD.dismiss()
        }
    }
}
