//
//  CMReferRoomMainTable.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/11.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMReferRoomMainTable: UIView {
 	let headArray:NSMutableArray = [CMReferRoomHeadSectionView(),CMReferRoomHeadSectionView()]
	let allChoiceArray:NSMutableArray = [false,false]
  	var tableview:UITableView?
	var numberSections:NSMutableArray?
	var editState:Bool?
  	override init(frame: CGRect) {
		super.init(frame: frame)
 		numberSections = [0,0]
		addSubViews()
		editState = false
 	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addSubViews(){
		tableview = UITableView(frame: .zero, style: .grouped)
		tableview?.register(CMReferRoomFileTableCell.self, forCellReuseIdentifier:"reusedID" )
		tableview?.estimatedRowHeight = 0
		tableview?.estimatedSectionFooterHeight = 0
		tableview?.estimatedSectionHeaderHeight = 0
		tableview?.delegate = self
		tableview?.dataSource = self
		tableview?.tableFooterView = UIView()
		self.addSubview(tableview!)
		tableview?.snp.makeConstraints({ (make) in
			make.edges.equalToSuperview()
		})
		
		for i in (0..<self.headArray.count) {
			let	headsection:CMReferRoomHeadSectionView = self.headArray.object(at: i) as! CMReferRoomHeadSectionView
			headsection.allChoiceMap = { (isBool:Bool) in
				
				self.allChoiceArray.replaceObject(at: i, with: isBool)
 				self.tableview?.reloadSections(IndexSet(integer: i) , with: .none)
				
			}
		}
		
 	}
	
	public func setEditState(state:Bool){
		for head in self.headArray {
			self.editState = state
			let	headsection:CMReferRoomHeadSectionView = head as! CMReferRoomHeadSectionView
			headsection.enableEdited(state:state)
			
 			self.tableview?.reloadData()
		}
   	}
	
}

extension CMReferRoomMainTable:UITableViewDelegate,UITableViewDataSource{
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return (numberSections?.count)!
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return numberSections?.object(at: section) as! Int
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell:CMReferRoomFileTableCell = tableview?.dequeueReusableCell(withIdentifier: "reusedID") as! CMReferRoomFileTableCell
		cell.tag = indexPath.row
		cell.enableEdited(state:editState!, allchice:self.allChoiceArray.object(at: indexPath.section) as! Bool )
		cell.delCellMap = { (index:Int) in
			
			self.numberSections?.replaceObject(at: indexPath.section, with: 3)
 			self.tableview?.reloadSections(NSIndexSet(index: indexPath.section) as IndexSet, with: .none)
 
		}
 		return cell
	}
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print("on click")
	}
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 70.0
	}
 	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 44.0
	}
	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 0.01
	}
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let head:CMReferRoomHeadSectionView = self.headArray.object(at: section) as! CMReferRoomHeadSectionView
		head.addTarget(self, action: #selector(targetAction), for: .touchUpInside)
		head.tag = section
 		switch section {
		case 0:
			head.reloadData(filename: "默认文件夹（6）")
			break
		case 1:
			head.reloadData(filename: "视频采集资料（8）")
			break
		default:
			break
		}
		return head
	}
	
	@objc func targetAction(sender:CMReferRoomHeadSectionView){
 
		sender.isSelected = !sender.isSelected
		switch sender.isSelected {
		case true:
			numberSections?.replaceObject(at: sender.tag, with: 5)
			break
		case false:
			numberSections?.replaceObject(at: sender.tag, with: 0)
 			break
		}
		print(sender.isSelected)
 		sender.switchOnFunc(selected:sender.isSelected)
		let indexset:NSIndexSet = NSIndexSet(index: sender.tag)
		self.tableview?.reloadSections(indexset as IndexSet, with: .none)

 
	}
	
 }
