//
//  CMReferRoomHeadSectionView.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/11.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMReferRoomHeadSectionView: UIButton {
	
	let title:UILabel = UILabel()
	let switchOn:UIButton = UIButton(type: .custom)
	let icon:UIImageView = UIImageView(image: UIImage(named: "icon_folder")?.withRenderingMode(.alwaysOriginal))
	var allChoiceMap:(Bool) -> Void = {
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
		self.backgroundColor = Constant.vcBgColor
		
		let checkbtn:UIButton = UIButton(type: .custom)
		checkbtn.addTarget(self, action: #selector(check), for: .touchUpInside)
		checkbtn.setImage(UIImage(named: "icon_unselected")?.withRenderingMode(.alwaysOriginal), for: .normal)
		checkbtn.setImage(UIImage(named: "icon_selected")?.withRenderingMode(.alwaysOriginal), for: .selected)
 		self.addSubview(checkbtn)
		checkbtn.snp.makeConstraints { (make) in
			make.left.equalToSuperview().offset(10)
			make.centerY.equalToSuperview()
		}
		
		
 		self.addSubview(icon)
 		icon.snp.makeConstraints { (make) in
			make.left.equalToSuperview().offset(10)
			make.centerY.equalToSuperview()
 		}
		
		self.addSubview(title)
		title.snp.makeConstraints { (make) in
			make.left.equalTo(icon.snp.right).offset(8)
			make.centerY.equalTo(icon.snp.centerY)
		}
		
 		switchOn.setImage(UIImage(named: "icon_open_folder")?.withRenderingMode(.alwaysOriginal), for: .normal)
		switchOn.setImage(UIImage(named: "icon_close_folder")?.withRenderingMode(.alwaysOriginal), for: .selected)
		self.addSubview(switchOn)
		switchOn.snp.makeConstraints { (make) in
			make.centerY.equalToSuperview()
			make.right.equalToSuperview().offset(-15)
		}
		
 
	}
	public func enableEdited(state:Bool){
		
		if state {
			icon.snp.updateConstraints { (make) in
				make.left.equalTo(40)
			}
		}else{
			icon.snp.updateConstraints { (make) in
				make.left.equalTo(10)
			}
 		}
 
	}
	
 

 	@objc private func check(sender:UIButton){
		sender.isSelected = !sender.isSelected
        self.allChoiceMap(sender.isSelected)
	}
	
	public func switchOnFunc(selected:Bool){
 		switchOn.isSelected = !switchOn.isSelected
	}
	
	public func reloadData(filename:String){
		title.text = filename
 	}
}
