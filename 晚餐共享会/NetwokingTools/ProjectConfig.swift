//
//  ProjectConfig.swift
//  晚餐共享会
//
//  Created by 谭彪 on 2017/11/10.
//  Copyright © 2017年 谭彪. All rights reserved.
//

import Foundation
import UIKit

func LWLog<T>(message : T, file : String = #file, lineNumber : Int = #line) {
    
    #if DEBUG
        
        let fileName = (file as NSString).lastPathComponent
        print("[\(fileName):line:\(lineNumber)]- \(message)")
        
    #endif
}

let screenH = UIScreen.main.bounds.width

let screenW = UIScreen.main.bounds.height

