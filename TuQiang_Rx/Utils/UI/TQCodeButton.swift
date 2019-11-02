//
//  TQCodeButton.swift
//  TuQiang_Rx
//
//  Created by XieLB on 2019/1/17.
//  Copyright © 2019年 XieLB. All rights reserved.
//

import UIKit

class TQCodeButton: UIButton {

    /// 验证码倒计时的时长
    var durationOfCountDown = 60
    /// 保存倒计时的时长
    var tempDurationOfCountDown = 60
    /// 保存倒计时按钮的非倒计时状态的title
    var originalTitle = ""
    /// 定时器对象
    var timer: Timer!
    
    /// 重写设置文本方法
    ///
    /// - Parameters:
    ///   - title: 文本
    ///   - state: 状态
    override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title, for: state)
        if durationOfCountDown == tempDurationOfCountDown {
            originalTitle = title ?? ""
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        // 若正在倒计时，不响应点击事件
        if durationOfCountDown != tempDurationOfCountDown {
            return false
        }
        //        // 若未开始倒计时，响应并传递点击事件，开始倒计时
        //        startCountDown()
        return super.beginTracking(touch, with: event)
    }
    
    /// 开始倒计时
    func startCountDown() {
        timer = Timer.init(timeInterval: 1, target: self, selector: #selector(updateIDCountDownButtonTitle), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: .common)
    }
    
    /// 倒计时更新title
    @objc func updateIDCountDownButtonTitle() {
        if tempDurationOfCountDown == 0 {
            setTitle(originalTitle, for: .normal)
            tempDurationOfCountDown = durationOfCountDown
            timer.invalidate()
        }else {
            tempDurationOfCountDown = tempDurationOfCountDown - 1
            setTitle("\(tempDurationOfCountDown)秒", for: .normal)
        }
    }
    
    deinit {
        if timer != nil {
            timer.invalidate()
        }
    }
}
