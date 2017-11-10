//
//  MainNavigationViewController.swift
//  晚餐共享会
//
//  Created by 谭彪 on 2017/11/10.
//  Copyright © 2017年 谭彪. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       let  dict = [NSForegroundColorAttributeName: UIColor.darkGray]
    
        navigationBar.titleTextAttributes = dict
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
        
    }

}
