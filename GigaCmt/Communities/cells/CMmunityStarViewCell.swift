//
//  CMmunityStarViewCell.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/10.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMmunityStarViewCell: UITableViewCell {
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
		
		let kingImg:UIImageView = UIImageView()
		kingImg.image = UIImage(named: "icon_star_shop")?.withRenderingMode(.alwaysOriginal)
		self.contentView.addSubview(kingImg)
		kingImg.snp.makeConstraints { (make) in
			make.left.equalTo(title.snp.right).offset(8)
			make.centerY.equalTo(title.snp.centerY)
			
		}
		
	
		let flowlayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		flowlayout.itemSize = CGSize(width: Constant.screenWidth - 30, height: 230)
		flowlayout.minimumLineSpacing = 0
		flowlayout.minimumInteritemSpacing = 0
		flowlayout.scrollDirection = .horizontal
 
 		collectView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
		collectView?.backgroundColor =  Constant.vcBgColor
		collectView?.register(CMmunityStarColCell.self, forCellWithReuseIdentifier: "reused")
		collectView?.dataSource = self
		collectView?.delegate = self
		collectView?.isPagingEnabled = true
		collectView?.showsHorizontalScrollIndicator = false
		self.contentView.addSubview(collectView!)
		collectView?.snp.makeConstraints({ (make) in
			make.right.left.bottom.equalToSuperview()
			make.top.equalTo(kingImg.snp.bottom).offset(10)
		})
		
		
	}
	
    override func awakeFromNib() {
        super.awakeFromNib()

	}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

     }
	
	public func reloadResponseData(type:Int){
		title.text = (type == 1) ? "明星会员".localized() : "明星店铺".localized()
 	}

}

extension CMmunityStarViewCell:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 5
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused", for: indexPath)
		cell.tag = indexPath.section
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
