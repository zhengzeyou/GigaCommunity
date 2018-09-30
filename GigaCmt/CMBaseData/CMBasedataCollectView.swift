//
//  CMBasedataCollectView.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/14.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMBasedataCollectView: UIView {
	var collectView:UICollectionView?
 	let tableArray:NSMutableArray = [CMReferRoomMainTable(),CMReferRoomMainTable()]
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	override func layoutSubviews() {
		super.layoutSubviews()
		addSubViews()

	}
	private func addSubViews(){
		
		let flowlayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		flowlayout.itemSize = CGSize(width: Constant.screenWidth, height:self.height )
		flowlayout.minimumLineSpacing = 0
		flowlayout.minimumInteritemSpacing = 0
		flowlayout.scrollDirection = .horizontal
		
		collectView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
		collectView?.backgroundColor =  Constant.vcBgColor
		collectView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "reused")
		collectView?.dataSource = self
		collectView?.showsHorizontalScrollIndicator = false
 		self.addSubview(collectView!)
		collectView?.snp.makeConstraints({ (make) in
			make.edges.equalToSuperview()
 		})

	}
	
	public func setEditionState(state:Bool,index:Int){
		let table:CMReferRoomMainTable = self.tableArray.object(at: index) as! CMReferRoomMainTable
		table.setEditState(state: state)
	}
	
 }

extension CMBasedataCollectView:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 2
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused", for: indexPath)
 		let table:CMReferRoomMainTable = self.tableArray.object(at: indexPath.row) as! CMReferRoomMainTable
 		cell.contentView.addSubview(table)
		table.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}

		return cell
	}
}
