//
//  CMMypageFindFriendColCell.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/17.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMMypageFindFriendButtomColCell: UICollectionViewCell {
 	var collectView:UICollectionView?
	var dataArray:NSMutableArray = ["","","","","",""]

	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubViews()
	}
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addSubViews(){
		let scroll:UIScrollView = UIScrollView()
 		scroll.contentSize = CGSize(width: Constant.screenWidth, height: 420)
		self.contentView.addSubview(scroll)
		scroll.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}

		let searchView:CMMypageFindFriendSearchView = CMMypageFindFriendSearchView(frame: CGRect(x: 0, y: 0, width: Constant.screenWidth, height: 170))
		scroll.addSubview(searchView)
	
		let flowlayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		flowlayout.itemSize = CGSize(width: (Constant.screenWidth - 15)/2.0 , height: 70 )
		flowlayout.minimumLineSpacing = 15
		flowlayout.minimumInteritemSpacing = 15
		
		collectView = UICollectionView(frame: CGRect(x: 0, y: 170, width: Constant.screenWidth, height: 250), collectionViewLayout: flowlayout)
		collectView?.backgroundColor =  Constant.vcBgColor
		collectView?.showsVerticalScrollIndicator = false
		collectView?.isScrollEnabled = false
		collectView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "reused")
		collectView?.dataSource = self
		collectView?.delegate = self
		collectView?.showsHorizontalScrollIndicator = false
		scroll.addSubview(collectView!)
  	}
}

extension CMMypageFindFriendButtomColCell:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return self.dataArray.count
		
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused", for: indexPath)
 
		let bg:UIView = UIView()
		bg.layer.cornerRadius = 5
		bg.layer.masksToBounds = true
 		bg.backgroundColor = UIColor.colorFromHex(hex: 0xf2f4f6)
		cell.contentView.addSubview(bg)
		bg.snp.makeConstraints { (make) in
			make.bottom.top.equalToSuperview()
			make.left.equalToSuperview().offset( indexPath.row % 2 == 1 ? 0 : 15)
			make.right.equalToSuperview().offset( indexPath.row % 2 == 1 ? -15 : 0)
 		}
		
		let avator:UIImageView = UIImageView()
		avator.layer.cornerRadius = 25
		avator.layer.masksToBounds = true
		bg.addSubview(avator)
		avator.snp.updateConstraints { (make) in
			make.left.top.equalToSuperview().offset(10)
			make.width.height.equalTo(50)
		}
		avator.kf.setImage(with:URL(string:"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2902141346,3120927423&fm=27&gp=0.jpg")!)
		
		let nick:UILabel = UILabel()
		nick.text = "Bonnie"
		bg.addSubview(nick)
		nick.snp.makeConstraints { (make) in
			make.left.equalTo(avator.snp.right).offset(10)
			make.top.equalTo(avator.snp.top)
			make.bottom.equalTo(avator.snp.centerY)
			make.right.equalToSuperview()
		}
		
		let sendBtn:UIButton = UIButton(type: .custom)
		sendBtn.setTitle("发送申请".localized(), for: .normal)
		sendBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
		sendBtn.setTitleColor(UIColor.colorFromHex(hex: 0x1e4488), for: .normal)
		sendBtn.layer.borderColor = UIColor.colorFromHex(hex: 0x1e4488).cgColor
		sendBtn.layer.borderWidth = 1
		sendBtn.layer.cornerRadius = 3
		sendBtn.layer.masksToBounds = true
		bg.addSubview(sendBtn)
		sendBtn.snp.makeConstraints { (make) in
			make.left.equalTo(nick.snp.left)
			make.top.equalTo(avator.snp.centerY).offset(4)
			make.bottom.equalTo(avator.snp.bottom)
			make.width.equalTo(60)
		}
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
 	}
	
}

