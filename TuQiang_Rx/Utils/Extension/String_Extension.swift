//
//  String_Extension.swift
//  TuQiang_Rx
//
//  Created by XieLB on 2019/1/17.
//  Copyright © 2019年 XieLB. All rights reserved.
//

import Foundation
import CommonCrypto

extension String {
    
    /// 字符串md5加密
    func md5() -> String {
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        free(result)
        return String(format: hash as String)
    }
    
    /// 检查手机号格式正确性
    func validatePhoneNumber() -> Bool  {
        let phoneNum = self as NSString
        if phoneNum.length != 11 {
            return false
        }
        let newPhoneNum = phoneNum.substring(to: 3)
        let pattern = "^1[3|4|5|6|7|8|9][0-9]$"
        let regex = NSPredicate(format: "SELF MATCHES %@", pattern)
        return regex.evaluate(with: newPhoneNum)
    }
    
    /// 检查验证码格式正确性
    func validatePureNumber() -> Bool  {
        if self.count != 6 {
            return false
        }
        let str = self.trimmingCharacters(in: CharacterSet.decimalDigits)
        if str.count > 0 {
            return false
        }
        return true
    }
    
    /// 检查密码格式正确性（有数字且有英文）
    func validatePassword() -> Bool  {
        //先判断是否满足包含数字和英文
        guard self.validateNumberAndEnglish() else {
            return false
        }
        //如果只有数字，返回
        if self.validateNumber() {
            return false
        }
        //如果只有英文，返回
        if self.validateEnglish() {
            return false
        }
        return true
    }
    
    ///  检查全数字
    func validateNumber() -> Bool  {
        let pattern = "^[0-9]+$"
        let regex = NSPredicate(format: "SELF MATCHES %@", pattern)
        return regex.evaluate(with: self)
    }
    
    ///  检查全英文
    func validateEnglish() -> Bool  {
        let pattern = "^[A-Za-z]+$"
        let regex = NSPredicate(format: "SELF MATCHES %@", pattern)
        return regex.evaluate(with: self)
    }
    
    ///  检查数字和英文
    func validateNumberAndEnglish() -> Bool  {
        let pattern = "^[A-Z0-9a-z]+$"
        let regex = NSPredicate(format: "SELF MATCHES %@", pattern)
        return regex.evaluate(with: self)
    }
}
