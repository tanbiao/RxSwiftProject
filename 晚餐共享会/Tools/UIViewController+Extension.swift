//
//  UIViewController+Extension.swift
//  晚餐共享会
//
//  Created by 谭彪 on 2017/11/13.
//  Copyright © 2017年 谭彪. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController
{
     static func getViewController(storyBoardName:String,identifier :String) -> UIViewController {
        
        let sb = UIStoryboard(name: storyBoardName, bundle: nil)
        
        return sb.instantiateViewController(withIdentifier: identifier);
        
    }

}
