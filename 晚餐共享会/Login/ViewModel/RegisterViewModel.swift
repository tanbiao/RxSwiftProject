//
//  RegisterViewModel.swift
//  晚餐共享会
//
//  Created by 谭彪 on 2017/11/13.
//  Copyright © 2017年 谭彪. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class RegisterViewModel
{
    let phoneText = Variable("")
    let checkCodeText = Variable("")
    let invitationCodeText = Variable("")
    
    let registerTaps = PublishSubject<Void>()
    let getCheckCodeTaps = PublishSubject<Void>()
    
    var phoneTextUsable : Observable<Bool>
    var checkCodeUsable :Observable<Bool>
    var invitationCodeTextUsable : Observable<Bool>
    
    //结果不需要处理
    var getCheckCodeTapsResult : Observable<Void>
    var registerTapResult : Observable<HandlerResult>
    
    init()
    {
        phoneTextUsable = phoneText.asObservable().map({ (phone) -> Bool in
            return phone.isTelNumber()
        })
        
        checkCodeUsable = checkCodeText.asObservable().map({ (checkCode) -> Bool in
            return LoginHandler.valitVerificationCode(code: checkCode)
        })
        
        invitationCodeTextUsable = invitationCodeText.asObservable().map({ (invitationCode) -> Bool in
            
            return invitationCode.characters.count == 6
        })
        
        getCheckCodeTapsResult = getCheckCodeTaps.asObservable().withLatestFrom(phoneText.asObservable()).flatMapLatest({ (phone) -> Observable<Void> in
            
            return sendRxRequest().request(LoginAPIRouter.sendCode(phone: phone)).map({ (response) -> Void in
                
            })
        })
        
        let registerUsable = Observable.combineLatest(phoneText.asObservable(), checkCodeText.asObservable(), invitationCodeText.asObservable()) { (phone , checkCode, invitationCode) -> (String,String,String) in
            return (phone ,checkCode,invitationCode)
        }
        
        registerTapResult = registerTaps.asObservable().withLatestFrom(registerUsable).flatMapLatest({ (phone,checkocde,invitationCode) -> Observable<HandlerResult> in
            
            return sendRxRequest().request(LoginAPIRouter.rigster(phone: phone, smsCode: checkocde, invitationCode: invitationCode)).map({ (responese) -> HandlerResult in
                
                //这里面做处理
                return .ok(msg: "注册成功")
            })

        })
        
        
        
    }
    
    
}
