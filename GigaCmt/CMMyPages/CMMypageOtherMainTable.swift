//
//  CMMypageOtherMainTable.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/18.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMMypageOtherMainTable: UIView {
	var table:UITableView?
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubviews()
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addSubviews(){
		table = UITableView(frame: .zero, style: .plain)
		table?.delegate = self
		table?.dataSource = self
		table?.estimatedRowHeight = 0
		table?.estimatedSectionFooterHeight = 0
		table?.estimatedSectionHeaderHeight = 0
		table?.tableFooterView = UIView()
		self.addSubview(table!)
		table?.snp.makeConstraints({ (make) in
			make.edges.equalToSuperview()
		})
		
		createTableHeadView()
	}
	
	private func createTableHeadView(){
		let tablehead:UIImageView = UIImageView()
		tablehead.isUserInteractionEnabled = true
		tablehead.kf.setImage(with: URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1537861243&di=9c36b71b154668d2159cf4c0ae387fff&imgtype=jpg&er=1&src=http%3A%2F%2Fattach.66rpg.com%2Fbbs%2Fattachment%2Fforum%2F201505%2F09%2F093435goj4f2xejamfj4xm.jpg"))
		tablehead.frame = CGRect(x: 0, y: 0, width: Constant.screenWidth, height: Constant.screenHeight / 3.0)
		table?.tableHeaderView = tablehead
		
		let personalView:UIButton = UIButton(type: .custom)
		personalView.addTarget(self, action: #selector(settingPersonal), for: .touchUpInside)
		tablehead.addSubview(personalView)
		personalView.snp.makeConstraints { (make) in
			make.left.bottom.right.equalToSuperview()
			make.top.equalTo(tablehead.snp.bottom).offset(-tablehead.height / 3.0)
		}
		
		let avator:UIImageView = UIImageView()
		avator.isUserInteractionEnabled = true
		avator.kf.setImage(with: URL(string: "https://img2.woyaogexing.com/2018/09/13/580dd647409e4e9b89a226b17bb47044!400x400.jpeg"))
		avator.layer.cornerRadius = tablehead.height / 6.0 - 10.0
		avator.layer.masksToBounds = true
		personalView.addSubview(avator)
		avator.snp.makeConstraints { (make) in
			make.left.equalToSuperview().offset(15)
			make.top.equalToSuperview().offset(10)
			make.width.height.equalTo(tablehead.height / 3.0 - 20.0)
		}
		
		let nickname:UILabel = UILabel()
		nickname.text = "独善其身"
		nickname.textColor = Constant.vcBgColor
		personalView.addSubview(nickname)
		nickname.snp.makeConstraints { (make) in
			make.left.equalTo(avator.snp.right).offset(6)
			make.top.equalTo(avator.snp.top)
			make.bottom.equalTo(avator.snp.centerY)
			
		}
		
		let sign:UILabel = UILabel()
		sign.text = "我是个基佬 快来快约我搞基"
		sign.font = UIFont.systemFont(ofSize: 13)
		sign.textColor = Constant.vcBgColor
		personalView.addSubview(sign)
		sign.snp.makeConstraints { (make) in
			make.left.equalTo(avator.snp.right).offset(6)
			make.bottom.equalTo(avator.snp.bottom)
			make.top.equalTo(avator.snp.centerY)
			
		}
		
		let arrow:UIImageView = UIImageView(image: UIImage(named: "icon_personal_setting")?.withRenderingMode(.alwaysOriginal))
		personalView.addSubview(arrow)
		arrow.snp.makeConstraints { (make) in
			make.centerY.equalTo(avator.snp.centerY)
			make.right.equalToSuperview().offset(-15)
		}
		
	}
	
	
	
	@objc private func settingPersonal(sender:UIButton){
		let settingVC:CMPersonalSettingController = CMPersonalSettingController()
		settingVC.hidesBottomBarWhenPushed = true
		self.viewForController(view: self)?.navigationController?.pushViewController(settingVC, animated: true)
		
	}
}

extension CMMypageOtherMainTable : UITableViewDelegate,UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell:CMMypageOtherMainTableCell =  CMMypageOtherMainTableCell()
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
 		return 2.0 * Constant.screenHeight / 3.0 
	}
	
	
}
