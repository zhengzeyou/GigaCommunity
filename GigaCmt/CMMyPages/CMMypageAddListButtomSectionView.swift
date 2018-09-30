//
//  CMMypageAddListButtomSectionView.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/18.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMMypageAddListButtomSectionView: UIButton {

	var arrow:UIButton?
	var IsOpenMap:(Bool) -> Void = {
		(isBool:Bool) in
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addSubViews(){
		
		self.backgroundColor = UIColor.white
		
		let icon:UIImageView = UIImageView(image: UIImage(named: "icon_group")?.withRenderingMode(.alwaysOriginal))
		self.addSubview(icon)
		icon.snp.makeConstraints { (make) in
			make.top.equalToSuperview().offset(8)
			make.left.equalTo(15)
			make.width.height.equalTo(44)
		}
		
		let groupname:UILabel = UILabel()
		groupname.text = "四人帮（4）"
		groupname.textColor = Constant.blackColor
		self.addSubview(groupname)
		groupname.snp.makeConstraints { (make) in
			make.centerY.equalToSuperview()
			make.left.equalTo(icon.snp.right).offset(10)
		}
		
		arrow = UIButton(type:.custom)
		arrow?.setImage(UIImage(named: "icon_open_folder")?.withRenderingMode(.alwaysOriginal), for: .selected)
		arrow?.setImage(UIImage(named: "icon_close_folder")?.withRenderingMode(.alwaysOriginal), for: .normal)
		self.addTarget(self, action: #selector(arrowFunc), for: .touchUpInside)
		self.addSubview(arrow!)
		arrow?.snp.makeConstraints { (make) in
			make.centerY.equalToSuperview()
			make.right.equalToSuperview().offset(-15)
		}
		

	}
	public func setCurrentState(current:Bool){
		arrow?.isSelected = current
 	}
	
	@objc private func arrowFunc(sender:UIButton){
		arrow?.isSelected = !(arrow?.isSelected)!
		self.IsOpenMap((arrow?.isSelected)!)
	}
}
