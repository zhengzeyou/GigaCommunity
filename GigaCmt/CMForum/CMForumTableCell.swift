//
//  CMForumTableCell.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/10/8.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit
import PhotoBrowserSwift


class CMForumTableCell: UITableViewCell {
	var picCollectView:UICollectionView?
	var sections:Int?
	let content:UILabel = UILabel()
	var contentstr:String = ""
	var picCount:Int = 0

	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
 		super.init(style: style, reuseIdentifier: reuseIdentifier)
		addSubViews()

	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public func reloadData(dataDic:NSDictionary){
		contentstr = dataDic.object(forKey: "contentkey") as! String
		picCount = dataDic.object(forKey: "pickey") as! Int
  		self.content.text = contentstr
		sections = Int(self.picCount / 3)
		if self.picCount % 3 != 0 {
			sections = sections! + 1
		}
 		picCollectView?.snp.updateConstraints({ (make) in
 			make.height.equalTo(CGFloat(sections!)*(Constant.screenWidth/3.0 - 30.0))
		})

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
		
		let btnforum:UIButton = UIButton(type: .custom)
 		btnforum.titleLabel?.font = UIFont.systemFont(ofSize: 15)
		btnforum.layer.cornerRadius = 15
		btnforum.layer.masksToBounds = true
		btnforum.setTitle("讨论中".localized(), for: .normal)
		btnforum.setTitle("已关闭".localized(), for: .selected)
		btnforum.setBackgroundImage(UIImage(named: "grey.png"), for: .selected)
		btnforum.setBackgroundImage(UIImage(named: "green.png"), for: .normal)
 		btnforum.setTitleColor(Constant.greenColor, for: .normal)
		btnforum.setTitleColor(Constant.greyColor, for: .selected)
 		self.contentView.addSubview(btnforum)
		btnforum.snp.makeConstraints { (make) in
			make.right.equalToSuperview().offset(-15)
			make.centerY.equalTo(avator.snp.centerY)
			make.width.equalTo(60)
			make.height.equalTo(30)
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
		time.text = "2018-08-28 "
		self.contentView.addSubview(time)
		time.snp.makeConstraints { (make) in
			make.bottom.equalTo(avator.snp.bottom)
			make.top.equalTo(avator.snp.centerY)
			make.left.equalTo(avator.snp.right).offset(10)
		}
		
		content.textColor = Constant.blackColor
		content.numberOfLines = 0
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
		self.contentView.addSubview(picCollectView!)
		
		sections = Int(self.picCount / 3)
		if self.picCount % 3 != 0 {
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
		loveIcon.setBackgroundImage(UIImage(named: "icon_views"), for: .normal)
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

extension CMForumTableCell:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return self.picCount
		
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
		for _ in 0 ..< self.picCount {
			let photo:Photo = Photo(url: URL(string: "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2902141346,3120927423&fm=27&gp=0.jpg"))
			photos.add(photo)
		}
		PhotoBrowers(index: indexPath.row, photos: photos)
	}
	
	
}

