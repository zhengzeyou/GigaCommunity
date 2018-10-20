//
//  CMMypageReleaseTableViewCell.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/17.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit
import PhotoBrowserSwift


class CMMypageReleaseTableViewCell: UITableViewCell {
	var picCollectView:UICollectionView?
	var dataArray:NSMutableArray = ["","",""]

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		addSubViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addSubViews() {
		let avator:UIImageView = UIImageView()
		avator.layer.cornerRadius = 25.0
		avator.layer.masksToBounds = true
		self.contentView.addSubview(avator)
		avator.kf.setImage(with: URL(string: "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2902141346,3120927423&fm=27&gp=0.jpg"))
		avator.snp.makeConstraints { (make) in
			make.top.left.equalToSuperview().offset(15)
			make.height.width.equalTo(50)
		}
		
		let nickname:UILabel = UILabel()
		nickname.text = "大旺哥"
		self.contentView.addSubview(nickname)
		nickname.snp.makeConstraints { (make) in
			make.top.equalTo(avator.snp.top)
			make.bottom.equalTo(avator.snp.centerY)
			make.left.equalTo(avator.snp.right).offset(8)
		}
		
		let time:UILabel = UILabel()
		time.textColor = Constant.greyColor
		time.font = .systemFont(ofSize: 14)
		time.text = "2018-08-28 15:35"
		self.contentView.addSubview(time)
		time.snp.makeConstraints { (make) in
			make.bottom.equalTo(avator.snp.bottom)
			make.top.equalTo(avator.snp.centerY)
			make.left.equalTo(avator.snp.right).offset(10)
		}
		
		let content:UILabel = UILabel()
		content.numberOfLines = 0
		content.textColor = Constant.blackColor
 		content.text = "今天又是元气满满的一天"
		self.contentView.addSubview(content)
		content.snp.makeConstraints { (make) in
 			make.top.equalTo(avator.snp.bottom).offset(5)
			make.left.equalTo(nickname.snp.left)
			make.right.equalToSuperview().offset(-15)
		}

		let flowlayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		flowlayout.itemSize = CGSize(width: Constant.screenWidth/3.0 - 30.0 , height: Constant.screenWidth/3.0 - 30.0 )
		flowlayout.minimumLineSpacing = 0
		flowlayout.minimumInteritemSpacing = 0
		
		picCollectView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
		picCollectView?.backgroundColor =  Constant.vcBgColor
		picCollectView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "reused")
		picCollectView?.dataSource = self
		picCollectView?.delegate = self
		picCollectView?.showsHorizontalScrollIndicator = false
		self.contentView.addSubview(picCollectView ?? UICollectionView())
		
		var sections:Int?
		sections = Int(self.dataArray.count / 3)
		if self.dataArray.count % 3 != 0 {
			sections = sections! + 1
		}
		
		picCollectView?.snp.makeConstraints({ (make) in
			make.left.equalTo(content.snp.left)
			make.right.equalToSuperview().offset(-15)
			make.top.equalTo(content.snp.bottom).offset(5)
			make.height.equalTo(CGFloat(sections!)*(Constant.screenWidth/3.0 - 30.0))
		})

		let commentIcon:UIButton = UIButton(type: .custom)
		commentIcon.setBackgroundImage(UIImage(named: "icon_comments"), for: .normal)
		self.contentView.addSubview(commentIcon)
		commentIcon.snp.makeConstraints { (make) in
			make.left.equalTo(content.snp.left)
			make.top.equalTo((picCollectView?.snp.bottom)!).offset(10)
			make.width.height.equalTo(20)
 		}
		
		let commentCount:UILabel = UILabel()
		commentCount.textColor = Constant.greyColor
		commentCount.text = "9"
		commentCount.font = .systemFont(ofSize: 15)
		self.contentView.addSubview(commentCount)
		commentCount.snp.makeConstraints { (make) in
			make.centerY.equalTo(commentIcon.snp.centerY)
			make.left.equalTo(commentIcon.snp.right).offset(5)
 		}
 
		let loveIcon:UIButton = UIButton(type: .custom)
		loveIcon.setBackgroundImage(UIImage(named: "icon_like"), for: .normal)
		self.contentView.addSubview(loveIcon)
		loveIcon.snp.makeConstraints { (make) in
			make.left.equalTo(commentIcon.snp.right).offset(80)
			make.centerY.equalTo(commentIcon.snp.centerY)
			make.width.height.equalTo(20)
 		}
		
		let loveCount:UILabel = UILabel()
		loveCount.textColor = Constant.greyColor
		loveCount.text = "23"
		loveCount.font = UIFont.systemFont(ofSize: 14)
		self.contentView.addSubview(loveCount)
		loveCount.snp.makeConstraints { (make) in
			make.centerY.equalTo(loveIcon.snp.centerY)
			make.left.equalTo(loveIcon.snp.right).offset(5)
		}
		
		
	}
	
	public func PhotoBrowers(index:Int,photos:NSMutableArray){
		let pbVC:PhotoBrowser = PhotoBrowser.init(photos: photos as! [Photo], currentIndex: index)
		self.viewForController(view: self)?.present(pbVC, animated: true, completion: nil)
		
	}

}

extension CMMypageReleaseTableViewCell:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return self.dataArray.count
		
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused", for: indexPath)
		
		let bg:UIView = UIView()
		bg.backgroundColor = UIColor.colorFromHex(hex: 0xf2f2f2)
		cell.contentView.addSubview(bg)
		bg.snp.makeConstraints { (make) in
			make.left.top.equalToSuperview().offset(5)
			make.right.bottom.equalToSuperview().offset(-5)
			
		}
		let icon:UIImageView = UIImageView()
		bg.addSubview(icon)
 		icon.snp.updateConstraints { (make) in
			make.edges.equalToSuperview()
		}
		icon.kf.setImage(with:URL(string:"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2902141346,3120927423&fm=27&gp=0.jpg")!)
			
 
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
 			let photos:NSMutableArray = []
			for _ in 0 ..< self.dataArray.count {
				let photo:Photo = Photo(url: URL(string: "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2902141346,3120927423&fm=27&gp=0.jpg"))
				photos.add(photo)
			}
			PhotoBrowers(index: indexPath.row, photos: photos)
 	}
	
}

