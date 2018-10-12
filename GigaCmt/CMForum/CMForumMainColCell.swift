//
//  CMForumMainColCell.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/10/8.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMForumMainColCell: UICollectionViewCell {
	var tableview:UITableView?
	var data:NSArray = [["contentkey":"今天又是元气满满的一天气满满的一天","pickey":0],["contentkey":"今天又是元今天又是元气满满的一天今天又是元气满满的一天今天又是元气满","pickey":2],["contentkey":"今天又是元今天又是元气满满的一天今天又是元气满满的一天今天又是元气满满的一天气满满的一天","pickey":4]]
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
		tableview?.register(CMForumTableCell.self, forCellReuseIdentifier: "reused")
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

extension CMForumMainColCell : UITableViewDelegate,UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 3
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell:CMForumTableCell = tableview?.dequeueReusableCell(withIdentifier: "reused") as! CMForumTableCell
		cell.selectionStyle = .none
		cell.reloadData(dataDic: self.data.object(at: indexPath.row) as! NSDictionary)
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		let dataDic:NSDictionary = self.data.object(at: indexPath.row) as! NSDictionary
		let	picCount:Int = dataDic.object(forKey: "pickey") as! Int
		var sections:Int = Int(picCount / 3)
		if  picCount % 3 != 0 {
			sections = sections + 1
		}
		let contenstr:String = dataDic.object(forKey: "contentkey") as! String
		let height:CGFloat = getTextHeigh(textStr: contenstr, font: .systemFont(ofSize: 17), width: Constant.screenWidth - 88.0)

		return 115.0 + (CGFloat(sections)*(Constant.screenWidth/3.0 - 30.0)) + height
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let vc:CMForumDetailedController = CMForumDetailedController()
		vc.hidesBottomBarWhenPushed = true
		vc.tranferData(dic: self.data.object(at: indexPath.row) as! NSDictionary)
		self.viewForController(view: self)?.navigationController?.pushViewController(vc, animated: true)
	}
	
	func getTextHeigh(textStr:String,font:UIFont,width:CGFloat) -> CGFloat {
		let normalText: NSString = textStr as NSString
		let size = CGSize(width: width, height: 200)
		let dic = NSDictionary(object: font, forKey: NSAttributedStringKey.font as NSCopying)
		let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedStringKey : Any], context: nil)
		return stringSize.height
	}

}

