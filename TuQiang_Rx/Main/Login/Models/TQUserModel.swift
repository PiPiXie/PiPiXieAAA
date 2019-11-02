//
//  TQUserModel.swift
//  TuQiang_Rx
//
//  Created by XieLB on 2019/1/17.
//  Copyright © 2019年 XieLB. All rights reserved.
//

import UIKit
import ObjectMapper

class TQUserModel: TQBaseModel {

    var code = 0
    var message = ""
    var data: TQUserDataModel?
    
    required init?(map: Map) {
        super.init(map: map)
        
        mapping(map: map)
    }
    
    override func mapping(map: Map) {
        
        code    <- map["code"]
        message <- map["message"]
        data    <- map["data"]
    }
}


class TQUserDataModel: TQBaseModel {
    
    var img = ""
    var phone = ""
    var username = ""
    var email = ""
    var nickname = ""
    var userType = ""
    var id = ""
    
    required init?(map: Map) {
        super.init(map: map)
        
        mapping(map: map)
    }
    
    override func mapping(map: Map) {
        
        img         <- map["img"]
        phone       <- map["phone"]
        username    <- map["username"]
        email       <- map["email"]
        nickname    <- map["nickname"]
        userType    <- map["userType"]
        id          <- map["id"]
    }
}
