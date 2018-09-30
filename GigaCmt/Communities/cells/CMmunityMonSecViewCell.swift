//
//  CMmunityMonSecViewCell.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/11.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMmunityMonSecViewCell: UITableViewCell {
	
	var logoImg:UIImageView?
	var name:UILabel?
	var address:UILabel?
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
 		addsubViews()
 	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func addsubViews(){
		logoImg = UIImageView()
		logoImg?.backgroundColor = UIColor.brown
		logoImg?.layer.cornerRadius = 5
		logoImg?.layer.masksToBounds = true
		self.contentView.addSubview(logoImg!)
		logoImg?.snp.makeConstraints({ (make) in
			make.left.centerY.equalToSuperview()
			make.width.height.equalTo(70)
		})
		logoImg?.kf.setImage(with:URL(string:"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2902141346,3120927423&fm=27&gp=0.jpg")!)

		
		name = UILabel()
		name?.text = "萨维塔咖啡"
		self.contentView.addSubview(name!)
		name?.snp.makeConstraints({ (make) in
			make.top.equalTo((logoImg?.snp.top)!)
			make.bottom.equalTo((logoImg?.snp.centerY)!)
			make.left.equalTo((logoImg?.snp.right)!).offset(5)
		})
		
		address = UILabel()
		address?.textColor = Constant.greyColor
		address?.numberOfLines = 0
		address?.font = UIFont.systemFont(ofSize: 14)
		address?.text = "岳麓区曲阜河路天马校区学生公寓8栋201（禹城国际大酒店酒店）"
		self.contentView.addSubview(address!)
		address?.snp.makeConstraints({ (make) in
			make.bottom.equalTo((logoImg?.snp.bottom)!)
			make.top.equalTo((logoImg?.snp.centerY)!)
			make.left.equalTo((logoImg?.snp.right)!).offset(5)
			make.right.equalToSuperview().offset(-5)
		})

	}
	
}
