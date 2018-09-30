//
//  CMResetPwdController.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/19.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMResetPwdController: BaseController {
	override func viewDidLoad() {
		super.viewDidLoad()
		addNavigationBar()
		addSubViews()
		
	}
	private func addSubViews(){
		let tableview:UITableView = UITableView(frame: .zero, style: .plain)
		tableview.delegate = self
		tableview.dataSource = self
		tableview.tableFooterView = UIView()
		tableview.estimatedRowHeight = 0
		tableview.estimatedSectionFooterHeight = 0
		tableview.estimatedSectionHeaderHeight = 0
		tableview.backgroundColor = UIColor.colorFromHex(hex: 0xf2f2f2)
		self.view.addSubview(tableview)
		tableview.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}
		
		
		let nextTepBtn:UIButton = UIButton(type: .custom)
		nextTepBtn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
		nextTepBtn.layer.cornerRadius = 5
		nextTepBtn.layer.masksToBounds = true
		nextTepBtn.setTitle("确定", for: .normal)
		nextTepBtn.backgroundColor = UIColor.colorFromHex(hex: 0x113981)
		nextTepBtn.setTitleColor(Constant.vcBgColor, for: .normal)
		self.view.addSubview(nextTepBtn)
		nextTepBtn.snp.makeConstraints { (make) in
			make.right.equalTo(-30)
			make.left.equalTo(30)
			make.height.equalTo(50)
			make.top.equalTo(300)
		}
		
		
	}
	private func addNavigationBar(){
		
		self.navigationItem.title = "重置密码"
		self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon_back"), style: .plain, target: self, action: #selector(backaction))
		self.navigationController?.navigationBar.tintColor = Constant.blackColor
		
	}
	@objc private func buttonAction(){
		
	}
	
	@objc private func backaction(){
		self.dismiss(animated: true, completion: nil)
		
	}
	
}

extension CMResetPwdController:UITableViewDelegate,UITableViewDataSource{
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 2
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell:UITableViewCell = UITableViewCell()
		cell.textLabel?.text = (indexPath.row == 0 ? "设置新密码" : "确认新密码")

		let input:UITextField = UITextField()
		input.tintColor = Constant.blackColor
		input.placeholder = (indexPath.row == 0 ? "请输入新密码" : "请再次确认输入的密码")
		cell.contentView.addSubview(input)
		input.snp.makeConstraints { (make) in
			make.right.top.bottom.equalToSuperview()
			make.left.equalTo(130)
		}
 
		return cell
	}
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 80.0
	}
}
