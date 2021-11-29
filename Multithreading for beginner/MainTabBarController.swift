//
//  MainTabBarController.swift
//  Multithreading for beginner
//
//  Created by pavel mishanin on 19.11.2021.
//

import UIKit

class MainTabBarController: UITabBarController {

    var homeViewController = HomeViewController()
    var workViewController = WorkViewController()
    var buttonsViewControoller = ButtonsViewControoller()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        workViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        buttonsViewControoller.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
        
        viewControllers = [homeViewController, workViewController, buttonsViewControoller]
    }
    
}
