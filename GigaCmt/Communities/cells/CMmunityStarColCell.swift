//
//  CMmunityCollectionCell.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/11.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit
import Kingfisher

class CMmunityStarColCell: UICollectionViewCell {
	var starImg:UIImageView?
	var mainTitle:UILabel?
	var secTitle:UILabel?
	override init(frame: CGRect) {
		super.init(frame: frame)
 		addSubviews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addSubviews(){
		
		starImg = UIImageView()
 		starImg?.layer.cornerRadius = 6
		starImg?.layer.masksToBounds = true
		starImg?.backgroundColor = UIColor.brown
		self.addSubview(starImg!)
		starImg?.snp.makeConstraints({ (make) in
			make.left.equalTo(15)
			make.top.right.equalToSuperview()
			make.bottom.equalTo(-50)
		})
		starImg?.kf.setImage(with:URL(string:"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=710215262,2636023740&fm=26&gp=0.jpg")!)
 
 		mainTitle = UILabel()
		mainTitle?.textColor = Constant.blackColor
 		mainTitle?.text = "Caffebene咖啡陪你" + String(self.tag)
		self.addSubview(mainTitle!)
		mainTitle?.snp.makeConstraints({ (make) in
			make.top.equalTo((starImg?.snp.bottom)!)
			make.left.equalTo((starImg?.snp.left)!)
			make.height.equalTo(35)
		})
		
		secTitle = UILabel()
		secTitle?.textColor = Constant.greyColor
		secTitle?.text = "阳光午后，咖啡陪你"
		secTitle?.font = UIFont.systemFont(ofSize: 14)
		self.addSubview(secTitle!)
		secTitle?.snp.makeConstraints({ (make) in
			make.top.equalTo((mainTitle?.snp.bottom)!)
			make.left.equalTo((starImg?.snp.left)!)
		})

		
	}
	
    
}
