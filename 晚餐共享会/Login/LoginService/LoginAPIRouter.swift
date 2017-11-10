//
//  LoginAPIService.swift
//  晚餐共享会
//
//  Created by 谭彪 on 2017/11/10.
//  Copyright © 2017年 谭彪. All rights reserved.
//

import Foundation
import Moya

enum LoginAPIRouter : TargetType
{
    /*登录*/
    case login
    
    /*注册*/
    case logout
    
}

extension LoginAPIRouter
{
    
    var baseURL: URL
    {
       return URL(string: baseUrlString)!
    }
    
    var path: String
    {
        return ""
    }
        
    var method: Moya.Method
    {
      return .post
    }
    
    var parameters: [String : Any]?
    {
        return ["":""]
    }
    
    var parameterEncoding: ParameterEncoding
    {
        return JSONEncoding.default
    }
    
    /*单元测试用的*/
    var sampleData: Data
    {
        return "".data(using: .utf8)!
    }
    
    var task: Task
    {
        return .request
    }
    
    var validate: Bool {
        
        return true
    }
 
}
