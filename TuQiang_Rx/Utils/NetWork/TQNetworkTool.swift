//
//  TQNetworkTool.swift
//  TuQiang_Rx
//
//  Created by XieLB on 2019/1/17.
//  Copyright © 2019年 XieLB. All rights reserved.
//

import Foundation
import Moya


enum TQNetworkTool {
    
    enum TQNetworMethod {
        case get
        case post
    }
    
    enum TQNetworkCategory: String {

        case getPhoneCode = "/app/user/getPhoneCode"    //获取手机验证码
        case login = "/oauth/token"     //用户登录
        case checkPhoneCode = "/app/user/checkPhoneCode"    //检查手机号码与验证码是否对应
        case resetPwd = "/app/user/resetPwd"    //重置密码
        case getUserInfo = "/app/user/getUserInfo"  //获取个人资料
    }

    case parameter(type: TQNetworkCategory, parameters: [String: Any]?)
}


extension TQNetworkTool: TargetType {
    
    
    
    /// The target's base `URL`.
    var baseURL: URL {
        return URL(string: "http://10.0.60.58")!
    }
    
    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String {
        
        switch self {

        case .parameter(let type, _):
            return type.rawValue
        }
        
        return ""
    }
    
    /// The HTTP method used in the request.
    var method: Moya.Method {
        //        switch self {
        //        case .parameter(let type, _):
        //            if type == .login {
        //                return .get
        //            }
        //            return .post
        //        }
        return .post
    }
    
    /// The parameters to be encoded in the request.
    var parameters: [String: Any]? {
        return nil
    }
    
    /// The method used for parameter encoding.
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    /// Provides stub data for use in testing.
    var sampleData: Data {
        
        return Data()
    }
    
    /// The type of HTTP task to be performed.
    var task: Task {
        //请求任务事件（这里附带上参数）
        switch self {
        case .parameter(_, let parameters):
            return .requestParameters(parameters: parameters!,
                                      encoding: URLEncoding.httpBody)
        default:
            return .requestPlain
        }
    }
    
    /// Whether or not to perform Alamofire validation. Defaults to `false`.
    var validate: Bool {
        return false
    }
    
    var headers: [String : String]? {
        if TQUserManager.sharedInstance.isLogin {
            return ["Authorization": "Bearer " + TQUserManager.sharedInstance.loginModel!.access_token]
        }else {
            return ["Authorization": "Basic OWQwMGM2ZTI4OWJjNDkyYzo1ZjQ1Mjc1OGEyMjY0YzhhYTVhYjNmNThmYWRhNGE5MQ=="]
        }
//        TQUserManager.sharedInstance.isLogin = true
//        TQUserManager.sharedInstance.loginModel = model.data
        
    }
    
}

let tqNetTool = MoyaProvider<TQNetworkTool>()
