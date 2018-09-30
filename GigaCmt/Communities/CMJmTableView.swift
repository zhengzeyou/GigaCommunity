//
//  CMJmTableView.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/10.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

enum CellCategory:Int {
	case star
	case league
	case area
	
	init(offset:Int){
		self.init(rawValue:offset)!
	}
	
	var Cell:UITableViewCell? {
		switch self {
		case .star:
			do {
				let cell:CMmunityStarViewCell = CMmunityStarViewCell()
				cell.reloadResponseData(type: 0)
				return cell
 			}
		case .league:
			do {
				let cell:CMmunityMonViewCell = CMmunityMonViewCell()
				cell.reloadResponseData(type: 10)
				return cell
			}

 		case .area:
			do {
				let cell:CMmunityMonViewCell = CMmunityMonViewCell()
				cell.reloadResponseData(type: 11)
				return cell
			}
			
		}
	}

	
}

class CMJmTableView: UIView {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
 		addTableView()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addTableView(){
		let tableview = UITableView(frame: .zero, style: .plain)
		tableview.delegate = self
		tableview.dataSource = self
		tableview.tableFooterView = UIView()
		tableview.showsVerticalScrollIndicator = false
		tableview.separatorColor = Constant.vcBgColor
 		self.addSubview(tableview)
		tableview.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}

	}
	
	
}

extension CMJmTableView: UITableViewDelegate ,UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 3
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		switch indexPath.row {
		case CellCategory.star.rawValue:
 			return CellCategory.star.Cell!
		case CellCategory.league.rawValue:
			return CellCategory.league.Cell!
		case CellCategory.area.rawValue:
			return CellCategory.area.Cell!
 		default:
			return UITableViewCell()
		}
 	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//		switch indexPath.section {
//		case 0:
//		   return 300
//		case 1:
//			return 400
//		default:
			return 300
//		}
		
	}
	
	
}

