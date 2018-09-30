//
//  CMTopSegView.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/10.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit
import SnapKit

enum orientation:Int {
	case left
	case right
	
	init(offset:Int){
		self.init(rawValue:offset)!
		
	}
	
	var title:String{
		switch self {
		case .left:
			return "加盟店".localized()
		case .right:
			return "个人".localized()
 		}
	}

}

let jm:UIButton = UIButton(type:.custom)
let per:UIButton = UIButton(type:.custom)
let jmbottom:UILabel = UILabel()
let perbottom:UILabel = UILabel()


class CMTopSegView: UIView {
	var clickHeadIndexMap:(CGFloat)->Void = {(index:CGFloat)->Void in }

 	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubviews()
 	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension CMTopSegView{
	func addSubviews(){
		
 		jm.setTitle(orientation.left.title, for: .normal)
		jm.setTitleColor(Constant.greyColor, for: .normal)
		jm.setTitleColor(Constant.blackColor, for: .selected)
		jm.isSelected = true
		jm.tag = orientation.left.rawValue
   		jm.addTarget(self, action: #selector(jmfunc), for: .touchUpInside)
		self.addSubview(jm)
		
		jm.snp.makeConstraints { (make) in
			make.left.top.equalToSuperview()
			make.right.equalTo((self.snp.centerX))
 			make.bottom.equalToSuperview().offset(10)
		}
		
		jmbottom.backgroundColor = Constant.blackColor
		self.addSubview(jmbottom)
		jmbottom.snp.makeConstraints { (make) in
			make.bottom.equalToSuperview().offset(10)
			make.height.equalTo(2)
			make.left.equalTo(jm.snp.left).offset(10)
			make.right.equalTo(jm.snp.right).offset(-10)
		}
		

 		per.setTitle(orientation.right.title, for: .normal)
		per.setTitleColor(Constant.greyColor, for: .normal)
		per.setTitleColor(Constant.blackColor, for: .selected)
		per.tag = orientation.right.rawValue
		per.addTarget(self, action: #selector(jmfunc), for: .touchUpInside)
		self.addSubview(per)
		
		per.snp.makeConstraints { (make) in
			make.right.top.equalToSuperview()
			make.left.equalTo((self.snp.centerX))
			make.bottom.equalToSuperview().offset(10)
		}
		
		perbottom.backgroundColor = Constant.blackColor
		perbottom.isHidden = true
		self.addSubview(perbottom)
		perbottom.snp.makeConstraints { (make) in
			make.bottom.equalToSuperview().offset(10)
			make.height.equalTo(2)
			make.left.equalTo(per.snp.left).offset(10)
			make.right.equalTo(per.snp.right).offset(-10)
		}

 
	}
	
	@objc func jmfunc(sender:UIButton){
		
		jm.isSelected = false
		per.isSelected = false
  		sender.isSelected = true
		self.clickHeadIndexMap(CGFloat(sender.tag))
 		switch sender.tag {
		
		case orientation.left.rawValue:
 			perbottom.isHidden = true
			jmbottom.isHidden = false
 			break
		
		case orientation.right.rawValue:
 			perbottom.isHidden = false
			jmbottom.isHidden = true
  			break
			
 		default:
			break
		}
		
		
	}
}
