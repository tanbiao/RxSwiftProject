//
//  BaseTableView.swift
//  晚餐共享会
//
//  Created by 谭彪 on 2017/11/13.
//  Copyright © 2017年 谭彪. All rights reserved.
//

import UIKit
import Foundation

class BaseTableView: UITableView {

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView?
    {
        let view = super.hitTest(point, with: event)
        
        if view?.classForCoder  != UIButton.self || view?.classForCoder != UITextField.self
        {
            view?.endEditing(true)
        }
        
        return view
    }

}
