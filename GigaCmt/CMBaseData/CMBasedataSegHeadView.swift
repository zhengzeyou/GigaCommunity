//
//  CMBasedataSegHeadView.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/14.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit
import SnapKit

var jms:UIButton?
var pers:UIButton?
var jmbottoms:UILabel?
var perbottoms:UILabel?


enum orientations:Int {
	case left
	case right
	
	init(offset:Int){
		self.init(rawValue:offset)!
		
	}
	
	var title:String{
		switch self {
		case .left:
			return "视频".localized()
		case .right:
			return "图片".localized()
		}
	}
	
}


class CMBasedataSegHeadView: UIView {
	
	var clickHeadIndexMap:(CGFloat)->Void = {(index:CGFloat)->Void in }
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubviews()
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension CMBasedataSegHeadView{
	func addSubviews(){
		
		self.layer.borderColor = UIColor.colorFromHex(hex: 0xdedede).cgColor
		self.layer.borderWidth = 0.4
		
		jms = UIButton(type: .custom)
		jms?.setTitle(orientations.left.title, for: .normal)
		jms?.setTitleColor(Constant.greyColor, for: .normal)
		jms?.setTitleColor(Constant.blackColor, for: .selected)
		jms?.isSelected = true
		jms?.tag = orientations.left.rawValue
		jms?.addTarget(self, action: #selector(jmfunc), for: .touchUpInside)
		self.addSubview(jms!)
		
		jms?.snp.makeConstraints { (make) in
			make.left.top.equalToSuperview()
			make.right.equalTo((self.snp.centerX))
			make.bottom.equalToSuperview().offset(10)
		}
		
		jmbottoms = UILabel(frame: .zero)
		jmbottoms?.backgroundColor = Constant.blackColor
		self.addSubview(jmbottoms!)
		jmbottoms!.snp.makeConstraints { (make) in
			make.bottom.equalToSuperview().offset(1)
			make.centerX.equalTo(jms!.snp.centerX)
			make.width.equalTo(36)
			make.height.equalTo(2)
		}
		
		pers = UIButton(type: .custom)
		pers?.setTitle(orientations.right.title, for: .normal)
		pers?.setTitleColor(Constant.greyColor, for: .normal)
		pers?.setTitleColor(Constant.blackColor, for: .selected)
		pers?.tag = orientations.right.rawValue
		pers?.addTarget(self, action: #selector(jmfunc), for: .touchUpInside)
		self.addSubview(pers!)
		
		pers?.snp.makeConstraints { (make) in
			make.right.top.equalToSuperview()
			make.left.equalTo((self.snp.centerX))
			make.bottom.equalToSuperview().offset(10)
		}
		
		
		perbottoms = UILabel(frame: .zero)
		perbottoms?.backgroundColor = Constant.blackColor
		perbottoms?.isHidden = true
		self.addSubview(perbottoms!)
		perbottoms?.snp.makeConstraints { (make) in
			
			make.bottom.equalToSuperview()
			make.centerX.equalTo((pers?.snp.centerX)!)
 			make.width.equalTo(36)
			make.height.equalTo(2)
 
		}
		
		
	}
	
	@objc func jmfunc(sender:UIButton){
		
		jms?.isSelected = false
		pers?.isSelected = false
		sender.isSelected = true
		self.clickHeadIndexMap(CGFloat(sender.tag))
		switch sender.tag {
			
		case orientations.left.rawValue:
			perbottoms?.isHidden = true
			jmbottoms?.isHidden = false
			break
			
		case orientations.right.rawValue:
			perbottoms?.isHidden = false
			jmbottoms?.isHidden = true
			break
			
		default:
			break
		}
		
		
	}
}
