//
//  HanderResult.swift
//  晚餐共享会
//
//  Created by 谭彪 on 2017/11/13.
//  Copyright © 2017年 谭彪. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

enum HandlerResult
{
    case ok(msg :String)
    case error(msg :String)
    case empty
}

extension HandlerResult
{
    var description :String {
       
        switch self {
        case .ok(msg: let msg):
            return msg
        case .empty:
            return ""
        case .error(msg: let msg):
            return msg
        }
    }

}

extension HandlerResult
{
    var isValite :Bool
    {
        switch self {
        case .ok:
            return true
        default:
            return false
        }

    }
}

extension Reactive where Base : UIButton
{
    var valite : UIBindingObserver<Base , Bool >
    {
        return UIBindingObserver(UIElement: base, binding: { (button, valite) in
            
            button.isEnabled = valite
            button.alpha = valite ? 1.0 : 0.5
            
        })
    }
    
}


extension Reactive where Base : UITextField
{
    var isInput : UIBindingObserver<Base , Bool >
    {
        return UIBindingObserver(UIElement: base, binding: { (button, valite) in
            
            button.isEnabled = valite
            button.alpha = valite ? 1.0 : 0.5
            
        })
    }
    
}
