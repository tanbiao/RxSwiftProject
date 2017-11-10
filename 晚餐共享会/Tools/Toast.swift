//
//  Toast.swift
//  
//
//  Created by 谭彪 on 2017/11/8.
//
//

import Foundation
import SVProgressHUD

let delayTime = 1.5

class Toast
{
    init()
    {
        SVProgressHUD.setDefaultStyle(.custom)
        
        SVProgressHUD.setDefaultMaskType(.clear)
        
        SVProgressHUD.setBackgroundColor(UIColor.white)
        
        SVProgressHUD.setRingRadius(5)
        //设置字体颜色
        SVProgressHUD.setForegroundColor(UIColor.red)
    }
}

extension Toast
{
    func show(text:String)
    {
       SVProgressHUD.show(withStatus: text)
       
       hudDismiss()
    }
    
    func showSuccess(text:String)
    {
        SVProgressHUD.showSuccess(withStatus: text)
        
        hudDismiss()
    }
    
    func showError(text:String)
    {
        SVProgressHUD.showError(withStatus: text)
        
        hudDismiss()
    }
    
    func dismiss()
    {
        SVProgressHUD.dismiss()
    }
    
    func showActivityIndicator()
    {
        SVProgressHUD.show(withStatus: "数据请求中...")
    }
    
    func hudDismiss()
    {
        let time = DispatchTime.now() + delayTime
    
        DispatchQueue.main.asyncAfter(deadline: time) {
           
            SVProgressHUD.dismiss()
        }
    }
   
}


