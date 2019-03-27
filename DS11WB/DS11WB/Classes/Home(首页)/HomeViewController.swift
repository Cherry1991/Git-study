//
//  HomeViewController.swift
//  DS11WB
//
//  Created by xiaomage on 16/4/1.
//  Copyright © 2016年 小码哥. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    // MARK:- 懒加载属性
    private lazy var titleBtn : TitleButton = TitleButton()
    
    // MARK:- 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1.没有登录时设置的内容
        visitorView.addRotationAnim()
        if !isLogin {
            return
        }
        
        // 2.设置导航栏的内容
        setupNavigationBar()
    }
}


// MARK:- 设置UI界面
extension HomeViewController {
    private func setupNavigationBar() {
        // 1.设置左侧的Item
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention")
        
        // 2.设置右侧的Item
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop")
        
        // 3.设置titleView
        titleBtn.setTitle("coderwhy", forState: .Normal)
        titleBtn.addTarget(self, action: "titleBtnClick:", forControlEvents: .TouchUpInside)
        navigationItem.titleView = titleBtn
    }
}


// MARK:- 事件监听的函数
extension HomeViewController {
    @objc private func titleBtnClick(titleBtn : TitleButton) {
        // 1.改变按钮的状态
        titleBtn.selected = !titleBtn.selected
        
        // 2.创建弹出的控制器
        let popoverVc = PopoverViewController()
        
        // 3.设置控制器的modal样式
        popoverVc.modalPresentationStyle = .Custom
        
        // 4.弹出控制器
        presentViewController(popoverVc, animated: true, completion: nil)
    }
}


