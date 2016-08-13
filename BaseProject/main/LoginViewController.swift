//
//  LoginViewController.swift
//  BaseProject
//
//  Created by wzl wzl on 16/8/10.
//  Copyright © 2016年 wzl wzl. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var LocationBtn2:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        self.title = "登录"
        self.view.backgroundColor = theme.WZLBackgroundColor
        addPresent()
    }
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func addPresent(){
        LocationBtn2 = UIButton(frame: CGRectMake(80,150,AppWidth-160,50))
        LocationBtn2.backgroundColor = theme
            .BaseBlue
        LocationBtn2.setTitle("Present", forState: UIControlState.Normal)
        LocationBtn2.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        LocationBtn2.addTarget(self, action: "presentGo", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(LocationBtn2)
    }
    func presentGo(){
        
        self.presentViewController(MainTabBarController(), animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
