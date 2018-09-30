//
//  CMMypageRestButtomColCell.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/17.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMMypageRestButtomColCell: UICollectionViewCell {
	var tableview:UITableView?
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubViews()
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addSubViews(){
		
		tableview = UITableView(frame: .zero, style: .plain)
		tableview?.tableFooterView = UIView()
 		tableview?.estimatedRowHeight = 0
		tableview?.estimatedSectionFooterHeight = 0
		tableview?.estimatedSectionHeaderHeight = 0
		tableview?.delegate = self
		tableview?.dataSource = self
		self.contentView.addSubview(tableview!)
		tableview?.snp.makeConstraints({ (make) in
			make.edges.equalToSuperview()
		})
		
	}
	
}

extension CMMypageRestButtomColCell : UITableViewDelegate,UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 5
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell:UITableViewCell = UITableViewCell()
		
		let avator:UIImageView = UIImageView()
		avator.layer.cornerRadius = 25.0
		avator.layer.masksToBounds = true
		avator.isUserInteractionEnabled = true
		cell.contentView.addSubview(avator)
		avator.kf.setImage(with: URL(string: "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2902141346,3120927423&fm=27&gp=0.jpg"))
		avator.snp.makeConstraints { (make) in
			make.top.left.equalToSuperview().offset(15)
			make.height.width.equalTo(50)
		}
		let tapture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapAvator))
		avator.addGestureRecognizer(tapture)
		
		let nickname:UILabel = UILabel()
		nickname.text = "大旺哥"
		cell.contentView.addSubview(nickname)
		nickname.snp.makeConstraints { (make) in
			make.top.equalTo(avator.snp.top)
			make.bottom.equalTo(avator.snp.centerY)
			make.left.equalTo(avator.snp.right).offset(8)
		}
		
		let time:UILabel = UILabel()
		time.textColor = Constant.greyColor
		time.font = UIFont.systemFont(ofSize: 14)
		time.text = "2018-08-28 15:35"
		cell.contentView.addSubview(time)
		time.snp.makeConstraints { (make) in
			make.bottom.equalTo(avator.snp.bottom)
			make.top.equalTo(avator.snp.centerY)
			make.left.equalTo(avator.snp.right).offset(10)
		}
		
		let content:UILabel = UILabel()
		content.textColor = Constant.blackColor
		content.text = "为了gigakorea大家一起工作加油奋斗！！"
		cell.contentView.addSubview(content)
		content.snp.makeConstraints { (make) in
			make.top.equalTo(avator.snp.bottom).offset(5)
			make.left.equalTo(nickname.snp.left)
			make.right.equalToSuperview().offset(-15)
		}
		
		
		let delbtn:UIButton = UIButton(type: .custom)
		delbtn.addTarget(self, action: #selector(deleteFunc), for: .touchUpInside)
		delbtn.layer.cornerRadius = 15
		delbtn.layer.masksToBounds = true
		delbtn.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
		delbtn.setTitle("删除".localized(), for: .normal)
		delbtn.setTitleColor(Constant.greyColor, for: .normal)
		delbtn.backgroundColor = UIColor.colorFromHex(hex: 0xf2f2f2)
		cell.contentView.addSubview(delbtn)
		delbtn.snp.makeConstraints { (make) in
			make.centerY.equalTo(avator.snp.centerY)
			make.right.equalToSuperview().offset(-15)
			make.width.equalTo(60)
			make.height.equalTo(30)
		}
		

		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 100.0
	}
	
	
	@objc private func deleteFunc(sender:UIButton){
		
		self.tableview?.reloadData()
	}
	
	@objc private func tapAvator(){
		let vc:CMMypageOtherReleaseController = CMMypageOtherReleaseController()
		vc.hidesBottomBarWhenPushed = true
		self.viewForController(view: self)?.navigationController?.pushViewController(vc, animated: true)
	}
}

