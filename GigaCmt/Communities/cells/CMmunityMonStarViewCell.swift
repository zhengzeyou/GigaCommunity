//
//  CMmunityMonStarViewCell.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/11.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit
import Kingfisher
class CMmunityMonStarViewCell: UITableViewCell {
	var collectView:UICollectionView?
	let title:UILabel = UILabel()
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.contentView.backgroundColor = Constant.vcBgColor
		addSubviews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addSubviews(){
		
		title.text = "本月民星".localized()
		self.contentView.addSubview(title)
		title.snp.makeConstraints { (make) in
			make.left.equalToSuperview().offset(15)
			make.top.equalToSuperview().offset(25)
		}
		
		let more:UILabel = UILabel()
		more.textColor = Constant.greyColor
		more.font = UIFont.systemFont(ofSize: 14)
		more.text = "查看全部".localized()
		more.textAlignment = .right
		self.contentView.addSubview(more)
		more.snp.makeConstraints { (make) in
			make.top.equalTo(title.snp.top)
			make.right.equalToSuperview().offset(-15)
		}
		
		let flowlayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		flowlayout.itemSize = CGSize(width: 116, height: 116)
		flowlayout.minimumLineSpacing = 2
		flowlayout.minimumInteritemSpacing = 2
		flowlayout.scrollDirection = .horizontal
		
		collectView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
		collectView?.backgroundColor =  Constant.vcBgColor
		collectView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "reused")
		collectView?.dataSource = self
		collectView?.delegate = self
 		collectView?.showsHorizontalScrollIndicator = false
		self.contentView.addSubview(collectView!)
		collectView?.snp.makeConstraints({ (make) in
			make.right.left.bottom.equalToSuperview()
			make.top.equalTo(title.snp.bottom).offset(10)
		})
 	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
	}
	
	public func reloadResponseData(type:Int){
 	}
	
}

extension CMmunityMonStarViewCell:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 8
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused", for: indexPath)
		
		let logoView:UIImageView = UIImageView()
		logoView.backgroundColor = UIColor.brown
		logoView.layer.cornerRadius = 5
		logoView.layer.masksToBounds = true
  		cell.contentView.addSubview(logoView)
		logoView.snp.makeConstraints { (make) in
			
			make.left.equalToSuperview().offset(15)
			make.top.equalToSuperview()
			make.right.equalToSuperview().offset(-5)
			make.bottom.equalToSuperview().offset(-20)
		}
		logoView.kf.setImage(with: ImageResource(downloadURL: URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536898242445&di=7e3417e68fec332c4419717398731616&imgtype=0&src=http%3A%2F%2Ftx.haiqq.com%2Fuploads%2Fallimg%2F170505%2F0305311T4-1.jpg")!))
 
		let starname:UILabel = UILabel()
		starname.text = "Bonnie"
		starname.textAlignment = .center
		cell.contentView.addSubview(starname)
		starname.snp.makeConstraints { (make) in
			make.left.equalTo(logoView.snp.left)
			make.top.equalTo(logoView.snp.bottom)
		}
 
 		return cell
	}
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
		
		let currentOffX:CGFloat = scrollView.contentOffset.x
		var index:Int = Int(currentOffX / (Constant.screenWidth - 30.0))
		if (currentOffX - CGFloat(index) * (Constant.screenWidth - 30.0)) > (Constant.screenWidth / 2.0 - 15.0) {
			index = index + 1
		}
		UIView.animate(withDuration: 0.5) {
			self.collectView?.contentOffset.x = CGFloat(index) * (Constant.screenWidth - 30.0)
			self.collectView?.scrollToItem(at: IndexPath(row: index, section: 0), at: .left, animated: true)
			
		}
	}

	
}
