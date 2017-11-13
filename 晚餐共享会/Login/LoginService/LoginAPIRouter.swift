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
    case login(phone :String ,smsCode :String)
    /*注册*/
    case rigster(phone : String,smsCode:String,invitationCode:String)
    /*发送验证码
     */
    case sendCode(phone : String )
    
}

extension LoginAPIRouter
{
    
    var baseURL: URL
    {
       return URL(string: baseUrlString)!
    }
    
    var path: String
    {
        switch self
        {
            case .login:
                return "/api/v1/user/login"
            case .rigster:
                return "/api/v1/user/register"
            case .sendCode:
                return "/api/v1/sms/send"
        }
        
    }
        
    var method: Moya.Method
    {
      return .post
    }
    
    var parameters: [String : Any]?
    {
        switch self
        {
            case .login(phone: let phone , smsCode: let code):
                var dict : [String:Any] = ["phone":phone,"sms_code" :code]
                return dict.setPlatform()
            case .rigster(phone: let phone, smsCode: let smsCode , invitationCode: let invitationCode):
                var dict: [String:Any] = ["phone":phone,"sms_code" :smsCode,"invitation_code":invitationCode]
                return dict.setPlatform()
            case .sendCode(phone: let phone):
                var dict :[String:Any] = ["phone": phone,"type":1]
                return dict.setPlatform()
        }
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

extension Dictionary
{
    mutating func setPlatform() -> [String :Any]
    {
        var dict = self as! [String : Any]
        
        dict["platform"] = "ios"
        
        return dict
    }

}
