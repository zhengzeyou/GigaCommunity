//
//  CMPerTableView.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/10.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

enum Category:Int {
	case star
	case month
	case area
	
	init(offset:Int){
		self.init(rawValue:offset)!
	}
	
	var Cell:UITableViewCell? {
		switch self {
		case .star:
			do {
				let cell:CMmunityStarViewCell = CMmunityStarViewCell()
				cell.reloadResponseData(type: 1)
				return cell
			}
 		case .month:
			return CMmunityMonStarViewCell()
 		case .area:
			do {
				let cell:CMmunityMonViewCell = CMmunityMonViewCell()
				cell.reloadResponseData(type: 21)
				return cell
			}
 		}
	}
	
	
}

class CMPerTableView: UIView {
	
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
		tableview.separatorColor = Constant.vcBgColor
		tableview.showsVerticalScrollIndicator = false
 		self.addSubview(tableview)
		tableview.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}
		
	}
	
	
}

extension CMPerTableView: UITableViewDelegate ,UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 3
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		switch indexPath.row {
		case Category.star.rawValue:
			return Category.star.Cell!
		case Category.month.rawValue:
			return Category.month.Cell!
		case Category.area.rawValue:
			return Category.area.Cell!
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
