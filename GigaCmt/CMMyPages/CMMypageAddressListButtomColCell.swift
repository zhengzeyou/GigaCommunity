//
//  CMMypageAddressListColCell.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/17.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMMypageAddressListButtomColCell: UICollectionViewCell {
	var tableview:UITableView?
	var dataSources:NSMutableArray?
	var isSelecteds:NSMutableArray?

	override init(frame: CGRect) {
		super.init(frame: frame)
		dataSources = [0,0]
		isSelecteds = [true,true]

		addSubViews()
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addSubViews(){
 
		tableview = UITableView(frame: .zero, style: .plain)
		tableview?.delegate = self
		tableview?.dataSource = self
		tableview?.estimatedRowHeight = 0
		tableview?.estimatedSectionFooterHeight = 0
		tableview?.estimatedSectionHeaderHeight = 0
		tableview?.tableFooterView = UIView()
		tableview?.register(CMMypageAddListButtomSectionTableCell.self, forCellReuseIdentifier: "reused")
		self.contentView.addSubview(tableview!)
		tableview?.snp.makeConstraints({ (make) in
			make.edges.equalToSuperview()
		})
		
		let sectionFooter:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: Constant.screenWidth, height: 60))
		sectionFooter.textAlignment = .center
		sectionFooter.text =  "共".localized() + String(22) + "位联系人".localized()
		sectionFooter.textColor = Constant.greyColor
		tableview?.tableFooterView = sectionFooter
		
	}
}

extension CMMypageAddressListButtomColCell:UITableViewDelegate,UITableViewDataSource{
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return (self.dataSources?.count)!
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.dataSources?.object(at: section) as! Int
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell:CMMypageAddListButtomSectionTableCell = tableView.dequeueReusableCell(withIdentifier: "reused") as! CMMypageAddListButtomSectionTableCell
		cell.delCellMap = { (index:Int) in
			self.dataSources?.replaceObject(at: indexPath.section, with:3)
			self.tableview?.reloadSections(IndexSet(integer: indexPath.section), with: .automatic)

		}
		return cell
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let sectionView:CMMypageAddListButtomSectionView = CMMypageAddListButtomSectionView()
		sectionView.IsOpenMap = {(isBool:Bool) in
			
			self.isSelecteds?.replaceObject(at: section, with: !(self.isSelecteds![section] as! Bool))
			self.dataSources?.replaceObject(at: section, with: ((self.isSelecteds![section] as! Bool) ? 0 : 4))
			self.tableview?.reloadSections(IndexSet(integer: section), with: .automatic)
 		}
		sectionView.setCurrentState(current: (self.isSelecteds![section] as! Bool))
		
		return sectionView
	}
	
 	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 80.0
	}
	
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
 		return 0.01
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 60.0
	}
	
	
}
