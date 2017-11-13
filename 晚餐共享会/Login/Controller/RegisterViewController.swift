//
//  RegisterViewController.swift
//  晚餐共享会
//
//  Created by 谭彪 on 2017/11/13.
//  Copyright © 2017年 谭彪. All rights reserved.
//

import UIKit

class RegisterViewController: UITableViewController {
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var checkCodeTextField: UITextField!
    
    @IBOutlet weak var invitationCodeTextField: UITextField!

    @IBOutlet weak var reigisterBtn: UIButton!
    
    @IBOutlet weak var getCheckCodeBtn: UIButton!
    
    lazy var viewModel = RegisterViewModel()
        
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
    }

  


}
