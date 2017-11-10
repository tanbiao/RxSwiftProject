//
//  MainTabBarController.swift
//  晚餐共享会
//
//  Created by 谭彪 on 2017/11/10.
//  Copyright © 2017年 谭彪. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    
    let  tabBarImages = [["image":"首页_未选中", "selectImage":"首页_选中"]
    ,["image":"消息_未选中","selectImage":"消息_选中"],
     ["image":"我_未选中", "selectImage":"我_选中"]]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        addChildViewControllers()
    }
    
    func addChildViewControllers()
    {
        for (i,item) in tabBarImages.enumerated()
        {
            switch i
            {
                case 0:
                
                addChildViewController(childViewController: UIViewController(), Titile: "首页", normalImage: item["image"]!, slectImage: item["selectImage"]!)
                  break
                
                case 1:
                 addChildViewController(childViewController: UIViewController(), Titile: "消息", normalImage: item["image"]!, slectImage: item["selectImage"]!)
                  break
                case 2:
                 addChildViewController(childViewController: UIViewController(), Titile: "我的", normalImage: item["image"]!, slectImage: item["selectImage"]!)
                  break
                default : break
            }
        }
        
    }
    
    func addChildViewController(childViewController : UIViewController, Titile : String,normalImage:String,slectImage : String)
    {
        childViewController.title = Titile
        childViewController.view.backgroundColor = UIColor.color(hexString: "#F7F6FB")
        childViewController.tabBarItem.image = UIImage.imageWithRender(imageName: normalImage)
        childViewController.tabBarItem.selectedImage = UIImage.imageWithRender(imageName:slectImage)
        let normalDict = [NSForegroundColorAttributeName : UIColor.color(hexString: "#7F8389")]
        childViewController.tabBarItem.setTitleTextAttributes(normalDict, for: .normal)
        
        let selectDict = [NSForegroundColorAttributeName : UIColor.color(hexString: "#FFA725")]
        childViewController.tabBarItem.setTitleTextAttributes(selectDict, for: .selected)
        
        let nav = MainNavigationController(rootViewController: childViewController)
        
        addChildViewController(nav)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
       

}
