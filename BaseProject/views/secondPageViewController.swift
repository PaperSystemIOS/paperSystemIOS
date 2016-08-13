//
//  secondPageViewController.swift
//  BaseProject
//
//  Created by wzl wzl on 16/7/27.
//  Copyright © 2016年 wzl wzl. All rights reserved.
//

import UIKit

class secondPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "服务"
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
extension secondPageViewController:UITableViewDataSource,UITableViewDelegate{
    //设置分区数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5
    }
    //设置分区里的条数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 2
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
            tableViewCell?.selectionStyle = UITableViewCellSelectionStyle.Gray
            tableViewCell?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        }
        if indexPath.section == 0 {
            if indexPath.row == 0{
                tableViewCell?.textLabel?.text = "论文系统"
                tableViewCell?.imageView?.image = UIImage(named: "图标_资讯_选中")
            }else{
                tableViewCell?.textLabel?.text = "题库系统"
                tableViewCell?.imageView?.image = UIImage(named: "图标_资讯_选中")
            }
        }else{
            if indexPath.section == 1 {
                tableViewCell!.textLabel!.text = "失物招领"
                tableViewCell?.imageView?.image = UIImage(named: "图标_资讯_选中")
            }else{
                if indexPath.section == 2 {
                    tableViewCell!.textLabel!.text = "跳蚤市场"
                    tableViewCell?.imageView?.image = UIImage(named: "图标_资讯_选中")
                }else{
                    if indexPath.section == 3 {
                        tableViewCell?.textLabel?.text = "报修服务"
                        tableViewCell?.imageView?.image = UIImage(named: "图标_资讯_选中")
                    }else{
                        tableViewCell?.textLabel?.text = "图书预约"
                        tableViewCell?.imageView?.image = UIImage(named: "图标_资讯_选中")
                    }
                }
            }
        }
        return tableViewCell!
    }
    //头尾的高度
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    //选择跳转
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        navigationController?.showViewController(turn1(), sender: nil)
        
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
    }
}
