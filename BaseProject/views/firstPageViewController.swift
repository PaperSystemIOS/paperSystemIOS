//
//  firstPageViewController.swift
//  BaseProject
//
//  Created by wzl wzl on 16/7/27.
//  Copyright © 2016年 wzl wzl. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation
import SnapKit

class firstPageViewController: UIViewController ,UIScrollViewDelegate{

    var LocationBtn:UIButton!
    var LocationBtn2:UIButton!
    
    var headView:UIView!
    let scrollerViewHeight:CGFloat = 180
    let menuTableHeight:CGFloat = 180
    let collectionSpacing:CGFloat = 10
    var scrollerView:UIScrollView!
    
    private let cellIdentifier = "menuCollectionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        self.view.backgroundColor = theme.WZLBackgroundColor
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
//        let data = Alamofire.request(.GET, "http://www.baidu.com/")

        let navigationTitleAttribute: NSDictionary = NSDictionary(object: UIColor.whiteColor(), forKey: NSForegroundColorAttributeName)
        self.navigationController?.navigationBar.titleTextAttributes = navigationTitleAttribute as! [String : AnyObject]
        self.navigationController?.navigationBar.barTintColor = theme.BaseBlue
        
        setScrollerView()
        setCollectionView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
//    func validLogin(){
//        if UserAccountTool.userIsLogin(){
//            let data = Alamofire.request(.GET, "http://www.baidu.com/")
//            print(data)
//            addLocation()
//            addPresent()
//        }else{
//            let shopCar = LoginViewController()
//            let nav = MainNavigationController(rootViewController: shopCar)
//            self.navigationController?.presentViewController(nav, animated: true, completion: nil)
//        }
//    }
//    func addLocation(){
//        
//        LocationBtn = UIButton()
//        self.view.addSubview(LocationBtn)
//        //使用snapKit做约束
//        LocationBtn.snp_makeConstraints { (make) -> Void in
//            make.top.equalTo(self.view).offset(20)
//            make.left.equalTo(self.view).offset(20)
//            make.bottom.equalTo(self.view).offset(-20)
//            make.right.equalTo(self.view).offset(-20)
//        }
//        LocationBtn.backgroundColor = theme
//            .BaseBlue
//        LocationBtn.setTitle("定位页面", forState: UIControlState.Normal)
//        LocationBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
//        LocationBtn.addTarget(self, action: "LocationGo", forControlEvents: UIControlEvents.TouchUpInside)
//        //self.view.addSubview(LocationBtn)
//    }
//    func addPresent(){
//        LocationBtn2 = UIButton(frame: CGRectMake(80,150,AppWidth-160,50))
//        LocationBtn2.backgroundColor = theme
//            .BaseBlue
//        LocationBtn2.setTitle("Present", forState: UIControlState.Normal)
//        LocationBtn2.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
//        LocationBtn2.addTarget(self, action: "presentGo", forControlEvents: UIControlEvents.TouchUpInside)
//        self.view.addSubview(LocationBtn2)
//    }
//    func LocationGo(){
//        let location = LocationTool()
//        self.navigationController?.showViewController(location, sender: nil)
//    }
//    func presentGo(){
//        
//        let shopCar = turn1()
//        let nav = MainNavigationController(rootViewController: shopCar)
//        self.navigationController?.presentViewController(nav, animated: true, completion: nil)
//    }
    func setScrollerView(){
        let count = 4
        headView = UIView(frame: CGRectMake(0,0,AppWidth,menuTableHeight+scrollerViewHeight+5))
        headView.backgroundColor = theme.WZLBackgroundColor
        self.view.addSubview(headView)
        scrollerView = UIScrollView(frame: CGRectMake(0,0,AppWidth,scrollerViewHeight))
        scrollerView.contentSize = CGSizeMake(CGFloat(count)*AppWidth, 0)
        scrollerView.pagingEnabled = true
        scrollerView.delegate = self
        headView.addSubview(scrollerView)
        if count != 0{
            for index in 0...count-1{
                let imgView = UIImageView(frame:CGRectMake(0,0,AppWidth,scrollerViewHeight))
                
                let imgData:NSData? = NSUserDefaults.standardUserDefaults().objectForKey("firstPageADImage0\(index)") as? NSData
                if imgData != nil{
                    let image = UIImage(data: NSUserDefaults.standardUserDefaults().objectForKey("firstPageADImage0\(index)") as! NSData)
                    imgView.image = image
                }else{
                    let image = UIImage(named: "welcome")
                    imgView.image = image
                }
                imgView.frame.origin.x = CGFloat(index) * AppWidth
                scrollerView.addSubview(imgView)
            }
        }
        
        //tableview的设置
        let tableView = UITableView(frame: CGRectMake(0, 0, AppWidth, AppHeight-115), style: UITableViewStyle.Grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.bounces = true
        tableView.tableHeaderView = headView
        self.view.addSubview(tableView)
    }
    
    func setCollectionView(){
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSizeMake(AppWidth/4, 80)
        let collection = UICollectionView(frame: CGRectMake(0,scrollerViewHeight,AppWidth,180), collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self
        collection.registerClass(menuCollectionCell.self, forCellWithReuseIdentifier: cellIdentifier)

        collection.backgroundColor = UIColor.whiteColor()
        headView.addSubview(collection)
        
    }
}

extension firstPageViewController: UITableViewDataSource ,UITableViewDelegate ,UICollectionViewDataSource ,UICollectionViewDelegate{
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "firstPageTableViewCellId")
        cell.selectionStyle = .Gray
        cell.textLabel!.text = "失物招领"
        cell.imageView?.image = UIImage(named: "图标_资讯_选中")
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("点击了首页的tableviewCell")
    }
    
    //collection
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        //在viewDidload()上要记得注册
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! menuCollectionCell
        
        cell.nameLabel.text = "kk"
        cell.backImageView.image = UIImage(named: "Icon1")
        
        return cell
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("点击了collectionview")
        collectionView.deselectItemAtIndexPath(indexPath, animated: false)
        
    }
}
