//
//  CMReferRoomNewFileView.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/12.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMReferRoomNewFileView: UIView {
	var tapCoverMap = { }
 	let cover:UIView = UIView()
	var collectView:UICollectionView?
	let icons:NSArray = ["icon_upload_img","icon_upload_video","icon_add_folder"]
	let titles:NSArray = ["上传图片".localized(),"上传视频".localized(),"新建文件夹".localized()]
	var uploadMap:(Int) -> Void = {
		(index:Int) in
	}
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addSubViews(){
		
		self.backgroundColor = Constant.vcBgColor
		self.layer.borderWidth = 1
		self.layer.borderColor = UIColor.colorFromHex(hex: 0xeeeeee).cgColor
		cover.backgroundColor = Constant.blackColor
		cover.alpha = 0.2
		let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(clickCover))
		cover.addGestureRecognizer(tap)
		(UIApplication.shared.delegate?.window)!?.addSubview(cover)
		cover.snp.makeConstraints { (make) in
			make.top.equalToSuperview().offset(self.frame.origin.y)
			make.left.bottom.right.equalToSuperview()
		}
		
		let flowlayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		flowlayout.itemSize = CGSize(width: Constant.screenWidth/4.0 , height: Constant.screenWidth/4.0 + 20.0)
		flowlayout.minimumLineSpacing = 1
		flowlayout.minimumInteritemSpacing = 1
 
		collectView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
		collectView?.backgroundColor =  Constant.vcBgColor
		collectView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "reused")
		collectView?.dataSource = self
		collectView?.delegate = self
		collectView?.showsHorizontalScrollIndicator = false
		self.addSubview(collectView!)
		collectView?.snp.makeConstraints({ (make) in
			make.edges.equalToSuperview()
		})

 
	}
	
	@objc private func uploadDel(sender:UIButton){
		print("下载和删除")
		hiddeSuv()
		
		
	}
	@objc private func clickCover(){
		self.tapCoverMap()
  		hiddeSuv()
	}
	
	public func hiddeSuv(){
		cover.isHidden = true
		cover.removeFromSuperview()
 		self.removeFromSuperview()
	}
}

extension CMReferRoomNewFileView:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 3
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused", for: indexPath)
 
		let icon:UIImageView = UIImageView(image: UIImage(named: icons.object(at:indexPath.row) as! String)?.withRenderingMode(.alwaysOriginal))
		cell.contentView.addSubview(icon)
 		icon.isUserInteractionEnabled = true
		icon.snp.makeConstraints { (make) in
			make.left.top.equalTo(15)
			make.width.height.equalTo(Constant.screenWidth/4.0 - 30.0)
		}

		let title:UILabel = UILabel()
		title.text = titles.object(at: indexPath.row) as? String
		title.textAlignment = .center
		title.textColor = Constant.greyColor
		title.font = UIFont.systemFont(ofSize: 12)
		cell.contentView.addSubview(title)
		title.snp.makeConstraints { (make) in
			make.bottom.equalToSuperview()
			make.width.equalTo(Constant.screenWidth/4.0)
			make.top.equalTo(icon.snp.bottom)
		}
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		self.uploadMap(indexPath.row)
 	}
	
	
}


