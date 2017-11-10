//
//  Observable+ObjectMapper.swift
//  TestAlamofire
//
//  Created by TengFei Tian on 2017/1/19.
//  Copyright © 2017年 田腾飞. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import ObjectMapper

extension Response {
  
    public func mapObject<T: BaseMappable>(_ type: T.Type) throws -> T {
        guard let object = Mapper<T>().map(JSONObject: try mapJSON()) else {
            throw MoyaError.jsonMapping(self)
        }
        return object
    }
    
    public func mapArray<T: BaseMappable>(_ type: T.Type) throws -> [T] {
        let json = JSON(data: self.data)
        
        let jsonArray = json["data"]["data"]
        
        guard let array = jsonArray.arrayObject as? [[String: Any]]
           else {
                
            throw MoyaError.jsonMapping(self)
        }
        
        let objects = Mapper<T>().mapArray(JSONArray: array)
        
        return objects
    }
    
}

extension ObservableType where E == Response {
    public func mapObject<T: BaseMappable>(_ type: T.Type) -> Observable<T> {
        return flatMap { response -> Observable<T> in
            return Observable.just(try response.mapObject(T.self))
        }
    }
    
    public func mapArray<T: BaseMappable>(_ type: T.Type) -> Observable<[T]> {
        return flatMap { response -> Observable<[T]> in
            return Observable.just(try response.mapArray(T.self))
        }
    }
}
