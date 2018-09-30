//
//  CMMypageFindFriendSearchView.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/17.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMMypageFindFriendSearchView: UIView {


	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	

	@objc private func addSubViews(){
 
		let inputSearch:UIView = UIView()
		inputSearch.backgroundColor = UIColor.colorFromHex(hex: 0xeeeeee)
		inputSearch.layer.cornerRadius = 4
		inputSearch.layer.masksToBounds = true
		self.addSubview(inputSearch)
		inputSearch.snp.makeConstraints { (make) in
			make.top.left.equalToSuperview().offset(15)
			make.right.equalToSuperview().offset(-15)
			make.height.equalTo(40)
		}
		
		let searchIcon:UIImageView = UIImageView(image: UIImage(named: "icon_search_friends")?.withRenderingMode(.alwaysOriginal))
		inputSearch.addSubview(searchIcon)
		searchIcon.snp.makeConstraints { (make) in
			make.centerY.equalToSuperview()
			make.left.equalToSuperview().offset(15)
			make.width.height.equalTo(22)
		}
		
		let input:UITextField = UITextField()
		input.placeholder = "搜索用户名".localized()
		input.tag = 2001
		input.tintColor = Constant.greyColor
		input.textColor = Constant.greyColor
		input.returnKeyType = .search
		inputSearch.addSubview(input)
		input.snp.makeConstraints { (make) in
			make.left.equalTo(searchIcon.snp.right).offset(10)
			make.right.top.bottom.equalToSuperview()
		}
		
		
		let choiceArea:UIView = UIView()
		choiceArea.backgroundColor = UIColor.colorFromHex(hex: 0xeeeeee)
		choiceArea.layer.cornerRadius = 4
		choiceArea.layer.masksToBounds = true
		self.addSubview(choiceArea)
		choiceArea.snp.makeConstraints { (make) in
			make.left.equalTo(inputSearch.snp.left)
			make.top.equalTo(inputSearch.snp.bottom).offset(15)
			make.right.equalTo(inputSearch.snp.right)
			make.height.equalTo(40)
		}
		
		let title:UILabel = UILabel()
		title.textColor = Constant.blackColor
		title.text = "地区筛选".localized()
		choiceArea.addSubview(title)
		title.snp.makeConstraints { (make) in
			make.centerY.equalToSuperview()
			make.left.equalToSuperview().offset(15)
 		}
		
		let arrow:UIButton = UIButton(type:.custom)
		arrow.setImage(UIImage(named: "icon_open_folder")?.withRenderingMode(.alwaysOriginal), for: .normal)
		arrow.setImage(UIImage(named: "icon_close_folder")?.withRenderingMode(.alwaysOriginal), for: .selected)
		arrow.addTarget(self, action: #selector(arrowFunc), for: .touchUpInside)
		choiceArea.addSubview(arrow)
		arrow.snp.makeConstraints { (make) in
 			make.centerY.equalToSuperview()
			make.right.equalToSuperview().offset(-15)
		}
		
		let referfriends:UILabel = UILabel()
		referfriends.text = "推荐好友".localized()
		referfriends.textColor = Constant.blackColor
		referfriends.font = UIFont.systemFont(ofSize: 22)
		self.addSubview(referfriends)
		referfriends.snp.makeConstraints { (make) in
			make.top.equalTo(choiceArea.snp.bottom).offset(25)
			make.left.equalToSuperview().offset(15)
		}
		
		let changeBtn:UIButton = UIButton(type: .custom)
		changeBtn.addTarget(self, action: #selector(changeNext), for: .touchUpInside)
		changeBtn.setImage(#imageLiteral(resourceName: "icon_refresh"), for: .normal)
		changeBtn.setTitle(" 换一批".localized(), for: .normal)
		changeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
		changeBtn.setTitleColor(Constant.greyColor, for: .normal)
		self.addSubview(changeBtn)
		changeBtn.snp.makeConstraints { (make) in
			make.centerY.equalTo(referfriends.snp.centerY)
			make.right.equalToSuperview().offset(-15)
		}
	}

	@objc private func changeNext(sender:UIButton){
		
		print("换一批~~~")
		
	}
	
	@objc private func arrowFunc(sender:UIButton){
		sender.isSelected = !sender.isSelected
		
	}
}
