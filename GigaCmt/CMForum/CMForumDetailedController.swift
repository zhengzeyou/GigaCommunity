//
//  CMForumDetailedController.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/10/8.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMForumDetailedController: BaseController {
	var tableview:UITableView?
	var datadic:NSDictionary = [:]
	var input:CMMypageInputView?

    override func viewDidLoad() {
        super.viewDidLoad()
 	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		setNavigationBar()

	}
	public func tranferData(dic:NSDictionary){
		self.datadic = dic
 		addTableViews()

	}
	private func setNavigationBar(){
		self.title = "讨论详情".localized()
		self.navigationController?.navigationBar.tintColor = Constant.blackColor
		self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
		self.navigationController?.navigationBar.backgroundColor = UIColor.white
		
 	}
	
	private func addTableViews(){
		self.tableview = UITableView(frame: .zero, style: .grouped)
		self.tableview?.estimatedRowHeight  = 0
		self.tableview?.estimatedSectionFooterHeight = 0
		self.tableview?.estimatedSectionHeaderHeight = 0
		self.tableview?.delegate = self
		self.tableview?.dataSource = self
		self.tableview?.tableFooterView = UIView()
		self.tableview?.register(CMForumTableCell.self, forCellReuseIdentifier: "reused1")
		self.tableview?.register(CMForumCommentTableViewCell.self, forCellReuseIdentifier: "reused2")
 		self.view.addSubview(self.tableview!)
		self.tableview?.snp.makeConstraints({ (make) in
			make.top.left.right.equalToSuperview()
			make.bottom.equalToSuperview().offset(-60)

		})
		
		self.input = CMMypageInputView()
		input?.sendReleaseMap = {(content:String) in
			
			if content.count == 0 {
				
			}else {
				
//				self.dataMutableArray.add(content)
//				self.tableview?.reloadData()
//				self.tableview?.scrollToRow(at: IndexPath(row:self.dataMutableArray.count - 1, section: 0), at: .bottom, animated: true)
				
			}
			
		}
		self.view.addSubview(input!)
		
		input?.snp.makeConstraints({ (make) in
 			make.left.right.bottom.equalToSuperview()
			make.height.equalTo(60)
		})
	}
	
	


}


extension CMForumDetailedController:UITableViewDelegate,UITableViewDataSource{
	func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return section == 0 ? 1 : 3
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		if indexPath.section == 0 {
			let cell:CMForumTableCell = tableView.dequeueReusableCell(withIdentifier: "reused1") as! CMForumTableCell
			cell.reloadData(dataDic: self.datadic)
			return cell

		} else {
			let cell:CMForumCommentTableViewCell = tableView.dequeueReusableCell(withIdentifier: "reused2") as! CMForumCommentTableViewCell
			cell.tag = indexPath.row
			cell.reloadData(contentstr: "今天又是元气满满的一天气满满的一天今天又是元气满满的一天气满满", hidden:indexPath.row == 1 ? true : false)
			cell.delCellMap = {(index:Int) in
				
			}
			return cell

		}
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		let dataDic:NSDictionary = self.datadic
		let	picCount:Int = dataDic.object(forKey: "pickey") as! Int
		var sections:Int = Int(picCount / 3)
		if  picCount % 3 != 0 {
			sections = sections + 1
		}
		let contenstr:String = dataDic.object(forKey: "contentkey") as! String
		let height:CGFloat = getTextHeigh(textStr: contenstr, font: .systemFont(ofSize: 17), width: Constant.screenWidth - 88.0)

		if indexPath.section == 0 {
			return 115.0 + (CGFloat(sections)*(Constant.screenWidth/3.0 - 30.0)) + height

		} else {
			
			let height1:CGFloat = getTextHeigh(textStr: "今天又是元气满满的一天气满满的一天今天又是元气满满的一天气满满", font: .systemFont(ofSize: 17), width: Constant.screenWidth - 88.0)

			return 110.0 + height1

		}
	}
	
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 0.01
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return section == 0 ? 0.01 : 50.0
	}

	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		if section == 1 {
			let view:UIView = UIView()
			view.backgroundColor = UIColor.colorFromHex(hex: 0xeeeeee)
			
			let title:UILabel = UILabel()
			title.backgroundColor = Constant.vcBgColor
			title.text = "   14条评论"
			title.textColor = Constant.blackColor
 			view.addSubview(title)
			title.snp.makeConstraints { (make) in
				make.left.bottom.right.equalToSuperview()
				make.top.equalToSuperview().offset(10)
			}
			
			
			return view
		}
		return nil
	}
	func getTextHeigh(textStr:String,font:UIFont,width:CGFloat) -> CGFloat {
		let normalText: NSString = textStr as NSString
		let size = CGSize(width: width, height: 200)
		let dic = NSDictionary(object: font, forKey: NSAttributedStringKey.font as NSCopying)
		let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedStringKey : Any], context: nil)
		return stringSize.height
	}
	
	

	
}
