//
//  CMMonColViewCell.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/11.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMmunityMonColCell: UICollectionViewCell {
	var tableview:UITableView = UITableView(frame: .zero, style: .plain)
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubviews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addSubviews(){
		
		tableview.register(CMmunityMonSecViewCell.self, forCellReuseIdentifier: "reusetableID")
		tableview.isScrollEnabled = false
		tableview.separatorColor = Constant.vcBgColor
		tableview.dataSource = self
		tableview.delegate = self
		tableview.tableFooterView = UIView()
		self.contentView.addSubview(tableview)
		tableview.snp.makeConstraints({ (make) in
			make.left.equalTo(15)
			make.top.right.equalToSuperview()
			make.bottom.equalTo(10)
			
		})
	}

}

extension CMmunityMonColCell:UITableViewDelegate,UITableViewDataSource{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 3
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier:"reusetableID" )
 		return cell!
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 80
	}
	
	
}
