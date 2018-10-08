//
//  CMForumCommentTableViewCell.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/10/8.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMForumCommentTableViewCell: UITableViewCell {
	let content:UILabel = UILabel()
	let btn:UIButton = UIButton(type: .custom)
	let avator:UIImageView = UIImageView()
	var delCellMap:(Int) -> Void = {(index:Int) in
		
	}

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		addSubViews()
		
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public func reloadData(contentstr:String,hidden:Bool){
		
		self.content.text = contentstr
 		if hidden {
			
			btn.isHidden = false
  			avator.image = UIImage(named: "img_anonymous")
		
		}else{
			
			avator.kf.setImage(with: URL(string: "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2902141346,3120927423&fm=27&gp=0.jpg"))

		}

 	}
	
	private func addSubViews() {
		avator.layer.cornerRadius = 25.0
		avator.layer.masksToBounds = true
		self.contentView.addSubview(avator)
		avator.snp.makeConstraints { (make) in
			make.top.left.equalToSuperview().offset(15)
			make.height.width.equalTo(50)
		}
		
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
		
		content.numberOfLines = 0
		content.textColor = Constant.blackColor
		self.contentView.addSubview(content)
		content.snp.makeConstraints { (make) in
			make.top.equalTo(avator.snp.bottom).offset(5)
			make.left.equalTo(nickname.snp.left)
			make.right.equalToSuperview().offset(-15)
		}
		
		let loveIcon:UIButton = UIButton(type: .custom)
		loveIcon.setBackgroundImage(UIImage(named: "icon_like"), for: .normal)
		self.contentView.addSubview(loveIcon)
		loveIcon.snp.makeConstraints { (make) in
			make.left.equalTo(content.snp.left)
			make.top.equalTo(content.snp.bottom).offset(10)
			make.width.height.equalTo(20)
		}
		
		btn.addTarget(self, action: #selector(popView), for: .touchUpInside)
		btn.isHidden = true
		btn.setImage(UIImage(named: "icon_operation")?.withRenderingMode(.alwaysOriginal), for: .normal)
		self.contentView.addSubview(btn)
		
		btn.snp.makeConstraints { (make) in
			make.centerY.equalTo(avator.snp.centerY)
			make.right.equalToSuperview().offset(-15)
			make.width.height.equalTo(50)
		}
		
		
	}
	
	@objc private func popView(){
		
		let boundframe:CGRect = self.convert(btn.bounds, to: (UIApplication.shared.delegate?.window)!)
		let uploadPopView:CMReferRoomUploadView = CMReferRoomUploadView(frame: CGRect(x: Constant.screenWidth - 88, y: boundframe.origin.y + 44, width: 60, height: 30))
		uploadPopView.setType(titles: ["修改".localized(),"删除".localized()])
		uploadPopView.tag = self.tag
		uploadPopView.delCellMap = { (index:Int) in
			self.delCellMap(index)
			
		}
		(UIApplication.shared.delegate?.window)!?.addSubview(uploadPopView)
		
		
	}

}
