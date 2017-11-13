//
//  LoginViewModel.swift
//  晚餐共享会
//
//  Created by 谭彪 on 2017/11/13.
//  Copyright © 2017年 谭彪. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class LoginViewModel
{
    let phoneText = Variable("")
    let verificationCode = Variable("")
    let loginBtnTaps = PublishSubject<Void>()
    let getCheckCodeBtnTaps = PublishSubject<Void>()
    
    var phoneTextUsable : Observable<Bool>
    var verificationCodeUsable : Observable<Bool>
    var checkCodeResult : Observable<HandlerResult>
    var loginResult :Observable<HandlerResult>
    
    
    init()
    {
        phoneTextUsable = phoneText.asObservable().flatMapLatest({ (text) -> Observable<Bool> in
            return Observable<Bool>.just(text.isTelNumber())
        })
        
        verificationCodeUsable = verificationCode.asObservable().map({ (text) -> Bool in
            
            return LoginHandler.valitVerificationCode(code: text)
        }).shareReplay(1)
        
        checkCodeResult = getCheckCodeBtnTaps.asObservable().withLatestFrom(phoneText.asObservable()).flatMapLatest({ (phone) -> Observable<HandlerResult> in
                       
            return sendRxRequest().request(LoginAPIRouter.sendCode(phone: phone)).map({ (response) -> HandlerResult in
                
                let json = JSON(data: response.data)
                
                if json["code"].intValue != 0
                {
                    return HandlerResult.error(msg: json["msg"].string!)
                }
                
                LWLog(message: json)
                
                return HandlerResult.ok(msg: "获取验证码成功")
            })
        })
        
        let phoneAndVerificationCode = Observable.combineLatest(phoneText.asObservable(), verificationCode.asObservable()) {
            ($1,$0)//返回元组
        }
        
        loginResult = loginBtnTaps.asObserver().withLatestFrom(phoneAndVerificationCode).flatMapLatest({ (phone,verificaitonCode) -> Observable<HandlerResult> in
            
            return sendRxRequest().request(LoginAPIRouter.login(phone: phone, smsCode: verificaitonCode)).map({ (response) -> HandlerResult in
                
                //这里结果不处理是因为Moya插件内部已经处理了
                return .empty
            })
        })
        

    
    }
    
}
