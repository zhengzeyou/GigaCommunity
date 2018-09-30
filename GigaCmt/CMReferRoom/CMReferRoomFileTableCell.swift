//
//  CMReferRoomFileTableCell.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/11.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMReferRoomFileTableCell: UITableViewCell {
	let icon:UIImageView = UIImageView()
	let maintitle:UILabel = UILabel()
	let sectitle:UILabel = UILabel()
	let btn:UIButton = UIButton(type: .custom)
	let checkbtn:UIButton = UIButton(type: .custom)
	var delCellMap:(Int) -> Void = {(index:Int) in
		
	}

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.backgroundColor = UIColor.colorFromHex(hex: 0xf0f0f0)
		self.selectionStyle = .none
		addSubViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addSubViews(){
		
		checkbtn.addTarget(self, action: #selector(check), for: .touchUpInside)
		checkbtn.setImage(UIImage(named: "icon_unselected")?.withRenderingMode(.alwaysOriginal), for: .normal)
		checkbtn.setImage(UIImage(named: "icon_selected")?.withRenderingMode(.alwaysOriginal), for: .selected)
		self.contentView.addSubview(checkbtn)
		checkbtn.snp.makeConstraints { (make) in
			make.left.equalToSuperview().offset(10)
			make.centerY.equalToSuperview()
		}

		icon.layer.cornerRadius = 5
		icon.layer.masksToBounds = true
 		icon.kf.setImage(with:URL(string:"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1537437407893&di=a2a6dfac73160a01170974b9d41528fb&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F15%2F42%2F39%2F01n58PICZdR_1024.png")!)
 		self.contentView.addSubview(icon)
		icon.snp.makeConstraints { (make) in
			make.top.left.equalToSuperview().offset(10)
			make.width.height.equalTo(50)
		}
		
		maintitle.text = "IMG_3388.jpg"
		self.contentView.addSubview(maintitle)
		maintitle.snp.makeConstraints { (make) in
			make.top.equalTo(icon.snp.top)
			make.left.equalTo(icon.snp.right).offset(8)
			make.bottom.equalTo(icon.snp.centerY)
		}
		
		sectitle.text = "508.5kb 2018-08-08"
		sectitle.textColor = Constant.greyColor
		sectitle.font = UIFont.systemFont(ofSize: 14)
		self.contentView.addSubview(sectitle)
		sectitle.snp.makeConstraints { (make) in
			make.bottom.equalTo(icon.snp.bottom)
			make.left.equalTo(icon.snp.right).offset(8)
			make.top.equalTo(icon.snp.centerY)
		}
		
		btn.addTarget(self, action: #selector(popView), for: .touchUpInside)
		btn.setImage(UIImage(named: "icon_operation")?.withRenderingMode(.alwaysOriginal), for: .normal)
 		self.contentView.addSubview(btn)
		btn.snp.makeConstraints { (make) in
			make.centerY.equalToSuperview()
			make.right.equalToSuperview().offset(-15)
			make.width.height.equalTo(50)
		}
  	}
	
	public func enableEdited(state:Bool,allchice:Bool){
		
		if state {
			icon.snp.updateConstraints { (make) in
				make.left.equalTo(40)
			}
		}else{
			icon.snp.updateConstraints { (make) in
				make.left.equalTo(10)
			}
 		}
		
		checkbtn.isSelected = allchice
  	}
	
	@objc private func check(sender:UIButton){
		sender.isSelected = !sender.isSelected
	}

	@objc private func popView(){
	
		let boundframe:CGRect = self.convert(btn.bounds, to: (UIApplication.shared.delegate?.window)!)
 		let uploadPopView:CMReferRoomUploadView = CMReferRoomUploadView(frame: CGRect(x: Constant.screenWidth - 88, y: boundframe.origin.y + 44, width: 60, height: 30))
		uploadPopView.setType(titles: ["下载".localized(),"删除".localized()])
 		uploadPopView.tag = self.tag
		uploadPopView.delCellMap = { (index:Int) in
			self.delCellMap(index)

		}
		(UIApplication.shared.delegate?.window)!?.addSubview(uploadPopView)
 
		
	}
}
