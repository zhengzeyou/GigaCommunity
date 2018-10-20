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
	var input:CMMypageInputView?
	var dataMutableArray:NSMutableArray?
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
		tableview?.estimatedSectionFooterHeight = 0
		tableview?.estimatedSectionHeaderHeight = 0
		tableview?.delegate = self
		tableview?.dataSource = self
		tableview?.register(CMMypageCommentRestViewCell.self, forCellReuseIdentifier: "cellID")
		tableview?.estimatedRowHeight = 0
 		self.contentView.addSubview(tableview ?? UITableView())
		tableview?.snp.makeConstraints({ (make) in

			make.edges.equalToSuperview()
		})
  		self.dataMutableArray = ["为了gigakorea大家一起工作加油奋斗！！","为了gigakorea大家一起工作加油奋斗！！","为了gigakorea大家一起工作加油奋斗！！为了gigakorea大家一起工作加油奋斗！！","为了gigakorea大家一起工作加油奋斗！！","为了gigakorea大家一起工作加油奋斗！！"]
 	}
}


extension CMMypageRestButtomColCell{
	
	public func refreshConstrains(){
		tableview?.snp.updateConstraints({ (make) in
			make.bottom.equalTo(-60)
		})
		
		input = CMMypageInputView()
 		input?.sendReleaseMap = {(content:String) in
 
			if content.count == 0 {
 
				
			}else {
				
				self.dataMutableArray?.add(content)
				self.tableview?.reloadData()
				self.tableview?.scrollToRow(at: IndexPath(row:(self.dataMutableArray?.count)! - 1, section: 0), at: .bottom, animated: true)
				
			}
 
		}
		self.contentView.addSubview(input!)
		input?.snp.makeConstraints({ (make) in
			make.left.right.bottom.equalToSuperview()
			make.height.equalTo(60)
		})
 	}
 }
extension CMMypageRestButtomColCell : UITableViewDelegate,UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return (self.dataMutableArray?.count)!
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell:CMMypageCommentRestViewCell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! CMMypageCommentRestViewCell
		cell.setCellData(data: (self.dataMutableArray?.object(at: indexPath.row) as? String)!)
 		cell.deleCommentCellMap = { _ in
			self.dataMutableArray?.removeObject(at: indexPath.row)
 			self.tableview?.reloadData()
		}

 		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		let contentString:String = ((self.dataMutableArray?.object(at: indexPath.row) as? String)!)
		let height:CGFloat = self.getTextHeigh(textStr: contentString, font: .systemFont(ofSize: 16), width: Constant.screenWidth - 88.0)
		return 80.0 + height
	}

	
	@objc private func tapAvator(){
		let vc:CMMypageOtherReleaseController = CMMypageOtherReleaseController()
		vc.hidesBottomBarWhenPushed = true
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

