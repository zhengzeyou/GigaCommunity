//
//  CMPersonalSettingController.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/15.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMPersonalSettingController: BaseController {
	let titleArray:NSMutableArray = ["头像".localized(),"用户名".localized(),"个人简介".localized(),"我的邮箱".localized(),"固定电话".localized(),"我的手机".localized(),"我的地址".localized()]
    override func viewDidLoad() {
        super.viewDidLoad()
		setNavigationBar()
		addSubviews()
     }
	
	private func addSubviews(){
		let table:UITableView = UITableView(frame: .zero, style: .plain)
		table.estimatedRowHeight = 0
		table.estimatedSectionHeaderHeight = 0
		table.estimatedSectionFooterHeight = 0
		table.tableFooterView = UIView()
	    table.delegate = self
		table.dataSource = self
		table.backgroundColor = UIColor.colorFromHex(hex: 0xf2f3f5)
		self.view.addSubview(table)
		table.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}
		
		let logout:UIButton = UIButton(type: .custom)
		logout.backgroundColor = UIColor.colorFromHex(hex: 0xee0000)
		logout.setTitle("退出登录".localized(), for:.normal)
		logout.setTitleColor(UIColor.white, for: .normal)
		logout.addTarget(self, action: #selector(logoutAction), for: .touchUpInside)
		self.view.addSubview(logout)
		logout.snp.makeConstraints { (make) in
			make.right.left.bottom.equalToSuperview()
			make.height.equalTo(60)
		}
	}
	
	@objc private func logoutAction(sender:UIButton){
		
	}

	private func setNavigationBar(){
		self.title = "个人资料".localized()
		self.navigationController?.navigationBar.tintColor = Constant.blackColor
		self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)

	}
	
	
}

extension CMPersonalSettingController :UITableViewDelegate,UITableViewDataSource{
	func numberOfSections(in tableView: UITableView) -> Int {
		return 3
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch section {
		case 2:
			return 1
			
		default:
			return 3
		}
 
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell:UITableViewCell = UITableViewCell()
		cell.textLabel?.text = self.titleArray.object(at: 3 * indexPath.section + indexPath.row) as? String
		
		let icon:UIImageView = UIImageView(image: UIImage(named: "icon_arrow01")?.withRenderingMode(.alwaysOriginal))
		cell.contentView.addSubview(icon)
		icon.snp.makeConstraints { (make) in
			make.centerY.equalToSuperview()
			make.right.equalToSuperview().offset(-15)
 		}
		
		if indexPath.section == 0 && indexPath.row == 0 {
			let avator:UIImageView = UIImageView()
			avator.backgroundColor = UIColor.brown
			avator.layer.cornerRadius = 30
			avator.layer.masksToBounds = true
			cell.contentView.addSubview(avator)
			avator.snp.makeConstraints { (make) in
				make.right.equalTo(icon.snp.left).offset(-8)
				make.centerY.equalToSuperview()
				make.width.height.equalTo(60)
			}
			avator.kf.setImage(with:URL(string:"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2902141346,3120927423&fm=27&gp=0.jpg")!)


		}else{
			let content:UILabel = UILabel()
			content.text = "小几把"
			content.textColor = Constant.blackColor
			content.textAlignment = .right
			cell.contentView.addSubview(content)
			content.snp.makeConstraints { (make) in
				make.right.equalTo(icon.snp.left).offset(-8)
				make.centerY.equalToSuperview()
			}

		}
		
		return cell
	}
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if indexPath.row == 0 && indexPath.section == 0 {
			return 80.0
		}
		else {
			return 54.0
 		}
 	}
	
	
	func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
		return 0.01
	}
	
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 10.0
	}
	
	
}
