//
//  UIImage+Extension.swift
//  晚餐共享会
//
//  Created by 谭彪 on 2017/11/10.
//  Copyright © 2017年 谭彪. All rights reserved.
//

import Foundation
import UIKit

extension UIImage
{
    static func imageWithRender(imageName : String)-> UIImage?
    {
        let image = UIImage.init(named: imageName)
        
        return image?.withRenderingMode(.alwaysOriginal)
    }

}
