//
//  CMmunityMonViewCell.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/11.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMmunityMonViewCell: UITableViewCell {
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
		flowlayout.itemSize = CGSize(width: Constant.screenWidth - 30, height: 240)
		flowlayout.minimumLineSpacing = 0
		flowlayout.minimumInteritemSpacing = 0
		flowlayout.scrollDirection = .horizontal
		
		collectView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
		collectView?.backgroundColor =  Constant.vcBgColor
		collectView?.register(CMmunityMonColCell.self, forCellWithReuseIdentifier: "reused")
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
		
 		switch type  {
		case 10:
			title.text = "本月加盟".localized()
			break
		case 11:
			title.text = "地区加盟".localized()
			break
 		case 21:
			title.text = "地区明星".localized()
			break

		default:
			break
		}
	}

	
}

extension CMmunityMonViewCell:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 4
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused", for: indexPath)
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
