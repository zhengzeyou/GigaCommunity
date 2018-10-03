//
//  CMMypageButtomColCell.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/15.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMMypageReleaseButtomColCell: UICollectionViewCell {
	var tableview:UITableView?
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
  		tableview?.register(CMMypageReleaseTableViewCell.self, forCellReuseIdentifier: "reused")
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

extension CMMypageReleaseButtomColCell : UITableViewDelegate,UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 3
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell:CMMypageReleaseTableViewCell = tableview?.dequeueReusableCell(withIdentifier: "reused") as! CMMypageReleaseTableViewCell
 		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 240.0
	}
	
}

