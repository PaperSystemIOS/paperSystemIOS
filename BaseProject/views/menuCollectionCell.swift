//
//  menuCollectionCell.swift
//  BaseProject
//
//  Created by wzl wzl on 16/8/12.
//  Copyright © 2016年 wzl wzl. All rights reserved.
//

import UIKit

class menuCollectionCell: UICollectionViewCell {

    //MARK: - 初始化子空间
    var backImageView: UIImageView = {
        let backImageView = UIImageView(frame: CGRectMake((AppWidth/4-AppWidth/8)/2,10,AppWidth/8,AppWidth/8))
        return backImageView
    }()
    
    var nameLabel: UILabel = {
        let nameLabel = UILabel(frame: CGRectMake(0,55,AppWidth/4,30))
        nameLabel.textAlignment = NSTextAlignment.Center
        nameLabel.font = UIFont.systemFontOfSize(14)
        nameLabel.textColor = UIColor.blackColor()
        return nameLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.whiteColor()
        addSubview(backImageView)
        addSubview(nameLabel)
    }
    
    
    var goods: menuType? {
        didSet {
            backImageView.image = UIImage(named: "Icon1")
            nameLabel.text = "菜单"

        }
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - 布局
    override func layoutSubviews() {
        super.layoutSubviews()
        backImageView = UIImageView(frame: CGRectMake((AppWidth/4-AppWidth/8)/2,10,AppWidth/8,AppWidth/8))
        nameLabel = UILabel(frame: CGRectMake(0,55,AppWidth/4,30))
    }

}

class menuType: NSObject {
    //失物列表模型
    var menu:String!
}