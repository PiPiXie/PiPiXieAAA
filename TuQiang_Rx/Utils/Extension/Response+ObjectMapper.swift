//
//  Response+ObjectMapper.swift
//  JMTuQiang
//
//  Created by Smile on 2018/6/1.
//  Copyright © 2018年 com.shenzhen.jimi. All rights reserved.
//

import Foundation

import RxSwift
import Moya
import ObjectMapper


// MARK: - Json -> Model
extension Response {
    // 将Json解析为单个Model
    public func mapObject<T: BaseMappable>(_ type: T.Type) throws -> T {
        
//        let json = String(data:self.data, encoding: String.Encoding.utf8)!
//        
        guard let json = try mapJSON() as? [String : Any] else {
            throw MoyaError.jsonMapping(self)
        }
        print("........json == \(json)")
//        guard let jsonSub = (json["data"] as? [String : Any]) else {
//            throw MoyaError.jsonMapping(self)
//        }
        guard let object = Mapper<T>().map(JSONObject: json) else {
            throw MoyaError.jsonMapping(self)
        }
//        guard let object = Mapper<T>().map(JSONObject: try mapJSON()) else {
//            throw MoyaError.jsonMapping(self)
//        }
        return object
    }
    
    // 将Json解析为多个Model，返回数组，对于不同的json格式需要对该方法进行修改
    public func mapArray<T:BaseMappable>(_ type: T.Type) throws -> [T] {
        
        guard let json = try mapJSON() as? [String : Any] else {
            throw MoyaError.jsonMapping(self)
        }
        
        guard let jsonArr = (json["data"] as? [[String : Any]]) else {
            throw MoyaError.jsonMapping(self)
        }
        
        return Mapper<T>().mapArray(JSONArray: jsonArr)
    }
}

// MARK: - Json -> Observable<Model>
extension ObservableType where E == Response {
    // 将Json解析为Observable<Model>
    public func mapObject<T: BaseMappable>(_ type: T.Type) -> Observable<T> {
        return flatMap { response -> Observable<T> in
            return Observable.just(try response.mapObject(T.self))
        }
    }
    // 将Json解析为Observable<[Model]>
    public func mapArray<T: BaseMappable>(_ type: T.Type) -> Observable<[T]> {
        return flatMap { response -> Observable<[T]> in
            return Observable.just(try response.mapArray(T.self))
        }
    }
}






