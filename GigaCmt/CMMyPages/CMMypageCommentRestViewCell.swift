//
//  CMMypageCommentRestViewCell.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/10/5.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMMypageCommentRestViewCell: UITableViewCell {
	var content:UILabel?
	let delbtn:UIButton = UIButton(type: .custom)
	var deleCommentCellMap:(Int) -> Void = {(index:Int) in}

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		addCellSubviews()
 	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addCellSubviews(){
		let avator:UIImageView = UIImageView()
		avator.layer.cornerRadius = 25.0
		avator.layer.masksToBounds = true
		avator.isUserInteractionEnabled = true
		self.contentView.addSubview(avator)
		avator.kf.setImage(with: URL(string: "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2902141346,3120927423&fm=27&gp=0.jpg"))
		avator.snp.makeConstraints { (make) in
			make.top.left.equalToSuperview().offset(15)
			make.height.width.equalTo(50)
		}
		let tapture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapAvator))
		avator.addGestureRecognizer(tapture)
		
		let nickname:UILabel = UILabel()
		nickname.text = "大旺哥"
		self.contentView.addSubview(nickname)
		nickname.snp.makeConstraints { (make) in
			make.top.equalTo(avator.snp.top)
			make.bottom.equalTo(avator.snp.centerY)
			make.left.equalTo(avator.snp.right).offset(8)
		}
		
		let time:UILabel = UILabel()
		time.textColor = Constant.greyColor
		time.font = .systemFont(ofSize: 14)
		time.text = "2018-08-28 15:35"
		self.contentView.addSubview(time)
		time.snp.makeConstraints { (make) in
			make.bottom.equalTo(avator.snp.bottom)
			make.top.equalTo(avator.snp.centerY)
			make.left.equalTo(avator.snp.right).offset(10)
		}
		content = UILabel()
		content?.font = .systemFont(ofSize: 16)
		content?.numberOfLines = 0
		content?.textColor = Constant.blackColor
		self.contentView.addSubview(self.content!)
		self.content?.snp.makeConstraints { (make) in
			make.top.equalTo(avator.snp.bottom).offset(5)
			make.left.equalTo(nickname.snp.left)
			make.right.equalToSuperview().offset(-15)
 		}
		
		delbtn.tag = self.tag
		delbtn.layer.cornerRadius = 15
 		delbtn.addTarget(self, action: #selector(deleteFunc), for: .touchUpInside)
 		delbtn.layer.masksToBounds = true
		delbtn.titleLabel?.font = .systemFont(ofSize: 14.0)
		delbtn.setTitle("删除".localized(), for: .normal)
		delbtn.setTitleColor(Constant.greyColor, for: .normal)
		delbtn.backgroundColor = UIColor.colorFromHex(hex: 0xf2f2f2)
		self.contentView.addSubview(delbtn)
		delbtn.snp.makeConstraints { (make) in
			make.centerY.equalTo(avator.snp.centerY)
			make.right.equalToSuperview().offset(-15)
			make.width.equalTo(60)
			make.height.equalTo(30)
		}
	}
	
	@objc private func deleteFunc(sender:UIButton){
		deleCommentCellMap(sender.tag)
	}
	

	public func setCellData(data:String){
		content?.text = data
	}
	@objc private func tapAvator(){
		let vc:CMMypageOtherReleaseController = CMMypageOtherReleaseController()
		vc.hidesBottomBarWhenPushed = true
		self.viewForController(view: self)?.navigationController?.pushViewController(vc, animated: true)
	}
	
}
