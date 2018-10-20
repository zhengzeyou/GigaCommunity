//
//  CMReferRoomUploadView.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/12.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMReferRoomUploadView: UIView {
	var cover:UIView?
	var loadbtn:UIButton?
	var delbtn:UIButton?
 	let bg:UIImageView = UIImageView(image: UIImage(named: "upload")?.withRenderingMode(.alwaysOriginal))
	var delCellMap:((Int) -> Void)?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addSubViews(){
		
		cover = UILabel(frame: .zero)
		cover?.backgroundColor = Constant.blackColor
		cover?.alpha = 0.2
		let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(clickCover))
		cover?.addGestureRecognizer(tap)
		(UIApplication.shared.delegate?.window)!?.addSubview(cover!)
		cover?.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}
 
		bg.frame = CGRect(x: self.x, y: self.y, width: self.width, height: self.height)
		bg.isUserInteractionEnabled = true
		(UIApplication.shared.delegate?.window)!?.addSubview(bg)
		
		loadbtn = UIButton(type: .custom)
		loadbtn?.frame = CGRect(x: 0, y: 2, width: 30, height: 30)
		loadbtn?.addTarget(self, action: #selector(uploadDel), for: .touchUpInside)
		loadbtn?.titleLabel?.font = UIFont.systemFont(ofSize: 10)
		loadbtn?.setTitleColor(UIColor.white, for: .normal)
		self.addSubview(loadbtn!)
 
		let line:UILabel = UILabel(frame: CGRect(x: 30, y: 12, width: 1, height: 10))
		line.backgroundColor = UIColor.white
		self.addSubview(line)
 
		delbtn = UIButton(type: .custom)
		delbtn?.frame = CGRect(x: 31, y: 2, width: 30, height: 30)
 		delbtn?.addTarget(self, action: #selector(uploadDel), for: .touchUpInside)
		delbtn?.titleLabel?.font = UIFont.systemFont(ofSize: 10)
		delbtn?.setTitleColor(UIColor.white, for: .normal)
		self.addSubview(delbtn!)
 
	}
	
	
	
	public func setType(titles:NSArray){
		loadbtn?.setTitle(titles.firstObject as? String, for: .normal)
		delbtn?.setTitle(titles.lastObject as? String, for: .normal)

	}
	
	@objc private func uploadDel(sender:UIButton){
		print("下载和删除")
		self.delCellMap!(self.tag)
		hiddeSuv()

	}
	@objc private func clickCover(){
	
		hiddeSuv()
 	}
	
	private func hiddeSuv(){
		cover?.isHidden = true
		cover?.removeFromSuperview()
		bg.isHidden = true
		bg.removeFromSuperview()
		self.removeFromSuperview()
	}
}
