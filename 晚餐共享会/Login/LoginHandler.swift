//
//  LoginHandler.swift
//  晚餐共享会
//
//  Created by 谭彪 on 2017/11/13.
//  Copyright © 2017年 谭彪. All rights reserved.
//

import Foundation
import UIKit

class LoginHandler
{
    
    static func valiatePhone(phone : String) -> HandlerResult
    {
        if phone.characters.count < 11
        {
            return .error(msg: "你输入的手机号位数小于11位")
        }
        
        if phone.characters.count > 11 {
            
            return .error(msg: "你输入的手机号已经大于11位")
        }
        
        if !phone.isTelNumber()
        {
            return .error(msg: "请输入正确的手机号")
        }
        return .ok(msg: "可以使用")
    }
    
    static func valitVerificationCode(code : String) ->Bool
    {
        if code.characters.count != 6
            {
            return false
        }
        
       return true
    }
    
}
