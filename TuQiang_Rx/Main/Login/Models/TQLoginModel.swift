//
//  TQResponseModel.swift
//  TuQiang_Rx
//
//  Created by XieLB on 2019/1/17.
//  Copyright © 2019年 XieLB. All rights reserved.
//

import UIKit
import ObjectMapper

class TQLoginModel: TQBaseModel {

    var code = 0
    var message = ""
    var data: TQLoginDataModel?
    
    required init?(map: Map) {
        super.init(map: map)
        mapping(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        code    <- map["code"]
        message <- map["message"]
        data    <- map["data"]
    }
}


class TQLoginDataModel: TQBaseModel {
    
    var access_token = ""
    var token_type = ""
    var refresh_token = ""
    var expires_in = 0
    var scope = ""
    
    required init?(map: Map) {
        super.init(map: map)
        mapping(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        access_token    <- map["access_token"]
        token_type      <- map["token_type"]
        refresh_token   <- map["refresh_token"]
        expires_in      <- map["expires_in"]
        scope           <- map["scope"]
    }
}


//import UIKit
//import RxDataSources
//import ObjectMapper
//
//
///* ============================= SectionModel =============================== */
//struct JMSection {
//
//    var items: [Item]
//}
//
//
//extension JMSection: SectionModelType {
//
//    typealias Item = JMMessageModel
//
//    init(original: JMSection, items: [JMSection.Item]) {
//        self = original
//        self.items = items
//    }
//}

