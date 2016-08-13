//
//  thirdPageViewController.swift
//  BaseProject
//
//  Created by wzl wzl on 16/7/27.
//  Copyright © 2016年 wzl wzl. All rights reserved.
//

import UIKit

class thirdPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我"
        self.view.backgroundColor = theme.WZLBackgroundColor
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        let navigationTitleAttribute: NSDictionary = NSDictionary(object: UIColor.whiteColor(), forKey: NSForegroundColorAttributeName)
        self.navigationController?.navigationBar.titleTextAttributes = navigationTitleAttribute as! [String : AnyObject]
        self.navigationController?.navigationBar.barTintColor = theme.BaseBlue
        
        setScrollerView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setScrollerView(){
        let tableView = UITableView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height), style: UITableViewStyle.Grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.bounces = true
        self.view.addSubview(tableView)
    }

}
extension thirdPageViewController: UITableViewDelegate,UITableViewDataSource{
    //设置分区数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    //设置分区里的条数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else if section == 1{
            return 4
        }else{
            return 1
        }
        
    }
    //设置每条cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var tableViewCell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("cellId")
        if tableViewCell==nil {
            tableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cellid")
            
            //设置每条cell的选中风格,系统有提供几种风格，如果还不够用，可以自定义，要继承tableviewcell
            tableViewCell?.textLabel?.font = UIFont.systemFontOfSize(15)
            tableViewCell?.selectionStyle = UITableViewCellSelectionStyle.None
            tableViewCell?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        }
        if indexPath.section == 0 {
            if indexPath.row == 0{
                let img = UIImageView(frame: CGRectMake(10,10,100,100))
                img.image = UIImage(named: "title")
                tableViewCell?.addSubview(img)
                
                let name = UILabel(frame: CGRectMake(130,20,100,30))
                name.text = "小红伞"
                tableViewCell?.addSubview(name)
                
                let title = UILabel(frame: CGRectMake(130,70,180,30))
                title.text = "欢迎来到易学缘～"
                tableViewCell?.addSubview(title)
                
                //tableViewCell?.textLabel?.text = "论文系统"
                //tableViewCell?.imageView?.image = UIImage(named: "图标_资讯_选中")
            }
        }else if indexPath.section == 1{
            if indexPath.row == 0 {
                tableViewCell!.textLabel!.text = "失物招领"
                tableViewCell?.imageView?.image = UIImage(named: "图标_资讯_选中")
            }else if indexPath.row == 1{
                tableViewCell!.textLabel!.text = "失物招领"
                tableViewCell?.imageView?.image = UIImage(named: "图标_资讯_选中")
            }else if indexPath.row == 2{
                tableViewCell!.textLabel!.text = "失物招领"
                tableViewCell?.imageView?.image = UIImage(named: "图标_资讯_选中")
            }else {
                tableViewCell!.textLabel!.text = "失物招领"
                tableViewCell?.imageView?.image = UIImage(named: "图标_资讯_选中")
            }
        }else{
            tableViewCell!.textLabel!.text = "设置"
            tableViewCell?.imageView?.image = UIImage(named: "图标_资讯_选中")
        }
        return tableViewCell!
    }
    //不同cell的高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 120
        }else{
            return 50
        }
    }
    //头尾的高度
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    //    //选择跳转
    //    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    //        if indexPath.section == 0{
    //            if indexPath.row == 0 {
    //                navigationController?.showViewController(apartmentFindViewController(), sender: nil)
    //            }else{
    //                navigationController?.showViewController(apartmentPayViewController(), sender: nil)
    //            }
    //        }else if indexPath.section == 1 {
    //            navigationController?.showViewController(lostViewController(), sender: nil)
    //        }else if indexPath.section == 2 {
    //            navigationController?.showViewController(repairsViewController(), sender: nil)
    //        }else if indexPath.section == 3 {
    //            let flea = fleaMarketViewController()
    //            navigationController?.showViewController(flea, sender: nil)
    //        }else{
    //            
    //        }
    //    }
}
