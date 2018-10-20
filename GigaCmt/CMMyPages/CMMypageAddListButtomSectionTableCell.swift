//
//  CMMypageAddListButtomSectionTableCell.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/18.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMMypageAddListButtomSectionTableCell: UITableViewCell {

	var icon:UIImageView?
	var maintitle:UILabel?
	var sectitle:UILabel?
	var btn:UIButton?
	var checkbtn:UIButton?
	var delCellMap:((Int) -> Void)?
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
 		self.contentView.backgroundColor = UIColor.colorFromHex(hex: 0xeeeeee)
 		self.selectionStyle = .none
		addSubViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addSubViews(){
		
		checkbtn = UIButton(type:.custom)
		checkbtn?.addTarget(self, action: #selector(check), for: .touchUpInside)
		checkbtn?.setImage(UIImage(named: "icon_unselected")?.withRenderingMode(.alwaysOriginal), for: .normal)
		checkbtn?.setImage(UIImage(named: "icon_selected")?.withRenderingMode(.alwaysOriginal), for: .selected)
		self.contentView.addSubview(checkbtn!)
		checkbtn?.snp.makeConstraints { (make) in
			make.left.equalToSuperview().offset(10)
			make.centerY.equalToSuperview()
		}
		
		icon = UIImageView(frame: .zero)
		icon?.backgroundColor = UIColor.brown
		icon?.layer.cornerRadius = 5
		icon?.layer.masksToBounds = true
		self.contentView.addSubview(icon!)
		icon?.snp.makeConstraints { (make) in
			make.top.left.equalToSuperview().offset(15)
			make.width.height.equalTo(50)
		}
		icon?.kf.setImage(with:URL(string:"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2902141346,3120927423&fm=27&gp=0.jpg")!)
		
		maintitle = UILabel(frame: .zero)
		maintitle?.text = "大哥"
		self.contentView.addSubview(maintitle!)
		maintitle?.snp.makeConstraints { (make) in
			make.centerY.equalTo((icon?.snp.centerY)!)
			make.left.equalTo((icon?.snp.right)!).offset(8)
 		}
		
		btn = UIButton(type: .custom)
		btn?.addTarget(self, action: #selector(popView), for: .touchUpInside)
		btn?.setImage(UIImage(named: "icon_operation")?.withRenderingMode(.alwaysOriginal), for: .normal)
		self.contentView.addSubview(btn!)
		btn?.snp.makeConstraints { (make) in
			make.centerY.equalToSuperview()
			make.right.equalToSuperview().offset(-15)
			make.width.height.equalTo(50)
		}
	}
	
	public func enableEdited(state:Bool,allchice:Bool){
		
		if state {
			icon?.snp.updateConstraints { (make) in
				make.left.equalTo(40)
			}
		}else{
			icon?.snp.updateConstraints { (make) in
				make.left.equalTo(10)
			}
		}
		
		checkbtn?.isSelected = allchice
	}
	
	@objc private func check(sender:UIButton){
		sender.isSelected = !sender.isSelected
	}
	
	@objc private func popView(){
		
		let boundframe:CGRect = self.convert(btn!.bounds, to: (UIApplication.shared.delegate?.window)!)
		let uploadPopView:CMReferRoomUploadView = CMReferRoomUploadView(frame: CGRect(x: Constant.screenWidth - 88, y: boundframe.origin.y + 44, width: 60, height: 30))
		uploadPopView.setType(titles: ["分组".localized(),"删除".localized()])
		uploadPopView.tag = self.tag
		uploadPopView.delCellMap = { (index:Int) in
			guard self.delCellMap != nil else {
				return
			}
			self.delCellMap?(index)
			
		}
		(UIApplication.shared.delegate?.window)!?.addSubview(uploadPopView)
		
		
	}
}
