//
//  String + Extension.swift
//  晚餐共享会
//
//  Created by 谭彪 on 2017/11/13.
//  Copyright © 2017年 谭彪. All rights reserved.
//

import Foundation
import UIKit

extension String
{
     func isTelNumber() -> Bool
     {
       let mobile = "^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$"
       let  CM = "^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$"
       let  CU = "^1(3[0-2]|5[256]|8[56])\\d{8}$"
       let  CT = "^1((33|53|8[09])[0-9]|349)\\d{7}$"
       let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
       let regextestcm = NSPredicate(format: "SELF MATCHES %@",CM )
       let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,CU)
       let regextestct = NSPredicate(format: "SELF MATCHES %@" ,CT)
        
       if ((regextestmobile.evaluate(with: self) == true)
           || (regextestcm.evaluate(with: self)  == true)
           || (regextestct.evaluate(with: self) == true)
           || (regextestcu.evaluate(with: self) == true))
        {
            
          return true
        }
         else
         {
             return false
        }
    }
}

