//
//  TQResponseBaseModel.swift
//  TuQiang_Rx
//
//  Created by XieLB on 2019/1/18.
//  Copyright © 2019年 XieLB. All rights reserved.
//

import UIKit
import ObjectMapper

class TQResponseBaseModel: TQBaseModel {
    
    var code = 0
    var message = ""
    var data = ""
    
    required init?(map: Map) {
        super.init(map: map)
        mapping(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        code    <- map["code"]
        message <- map["message"]
        data <- map["data"]
    }
}
