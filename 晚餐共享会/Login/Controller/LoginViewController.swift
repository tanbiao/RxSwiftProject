//
//  LoginViewController.swift
//  晚餐共享会
//
//  Created by 谭彪 on 2017/11/13.
//  Copyright © 2017年 谭彪. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class LoginViewController: UITableViewController {
        
    @IBOutlet weak var phoneView: UIView!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var verificationCodeView: UIView!
    
    @IBOutlet weak var verificationCodeTextField: UITextField!

    @IBOutlet weak var getCheckCodeBtn: UIButton!
    
    @IBOutlet weak var loginBtn: UIButton!
       
    let viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        phoneTextField.rx.text.orEmpty
        .throttle(0.3, scheduler: MainScheduler.instance)
        .bind(to: viewModel.phoneText)
        .addDisposableTo(disposeBag)
        
        verificationCodeTextField.rx.text.orEmpty
        .throttle(0.3, scheduler: MainScheduler.instance)
        .bind(to: viewModel.verificationCode)
        .addDisposableTo(disposeBag)
        
        getCheckCodeBtn.rx.tap
        .bind(to: viewModel.getCheckCodeBtnTaps)
        .addDisposableTo(disposeBag)
        
        loginBtn.rx.tap
        .bind(to: viewModel.loginBtnTaps)
        .addDisposableTo(disposeBag)
        
        viewModel.phoneTextUsable
        .bind(to: getCheckCodeBtn.rx.valite)
        .addDisposableTo(disposeBag)
        
        viewModel.phoneTextUsable
        .bind(to: verificationCodeTextField.rx.isInput)
        .addDisposableTo(disposeBag)
        
        viewModel.verificationCodeUsable
        .bind(to: loginBtn.rx.valite)
        .addDisposableTo(disposeBag)
        
        viewModel.checkCodeResult.subscribe(onNext: { (result) in
            
            switch result
            {
              case .error(msg: let msg):
                Toast().showError(text: msg)
              case .ok(msg: let msg):
                Toast().showSuccess(text: msg)
              default : break
            }
            
        }).addDisposableTo(disposeBag)
        
        loginBtn.rx.tap.subscribe(onNext: { (result) in
            
           LWLog(message: "登录点击了")
            
        }).addDisposableTo(disposeBag)
        
        viewModel.loginResult.subscribe(onNext: { (result) in
            
            //调用网络请求,结果不做处理是因为Maya已经统一处理了
        }).addDisposableTo(disposeBag)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }

}
