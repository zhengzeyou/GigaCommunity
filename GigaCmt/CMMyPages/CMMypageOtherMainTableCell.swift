//
//  CMMypageOtherMainTableCell.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/18.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMMypageOtherMainTableCell: UITableViewCell {
	var headcollectView:UICollectionView?
	var buttomcollectView:UICollectionView?
	
	let icons:NSArray = ["icon_my_moment","icon_message_board"]
	let titles:NSArray = ["他的发布".localized(),"留言板".localized()]
	let buttomLine:UILabel = UILabel()
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		addSubViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addSubViews(){
		
		//上方的表
		let flowlayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		flowlayout.itemSize = CGSize(width: Constant.screenWidth/2.0 , height: Constant.screenWidth/4.0 + 20.0)
		flowlayout.minimumLineSpacing = 0
		flowlayout.minimumInteritemSpacing = 0
		
		headcollectView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
		headcollectView?.backgroundColor =  Constant.vcBgColor
		headcollectView?.tag = 1001
		headcollectView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "reused")
		headcollectView?.dataSource = self
		headcollectView?.delegate = self
		headcollectView?.layer.borderColor = UIColor.colorFromHex(hex: 0xeeeeee).cgColor
		headcollectView?.layer.borderWidth = 0.6
		headcollectView?.showsHorizontalScrollIndicator = false
		self.contentView.addSubview(headcollectView!)
		headcollectView?.snp.makeConstraints({ (make) in
			make.left.top.right.equalToSuperview()
			make.height.equalTo( Constant.screenWidth/4.0 + 20.0)
		})
		
		buttomLine.backgroundColor = Constant.blackColor
		self.addSubview(buttomLine)
		buttomLine.snp.makeConstraints { (make) in
			make.width.equalTo(50)
			make.height.equalTo(2)
			make.top.equalTo((headcollectView?.snp.bottom)!).offset(-4)
			make.centerX.equalTo(Constant.screenWidth/4.0)
		}
		
		//下方的表
 		let flowlayout1:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		flowlayout1.itemSize = CGSize(width: Constant.screenWidth , height:2.0 * Constant.screenHeight / 3.0 - Constant.screenWidth/4.0 - 20.0 )
		flowlayout1.minimumLineSpacing = 0
		flowlayout1.minimumInteritemSpacing = 0
		flowlayout1.scrollDirection = .horizontal
		
		buttomcollectView?.isPagingEnabled = true
		buttomcollectView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout1)
		buttomcollectView?.backgroundColor =  Constant.vcBgColor
		buttomcollectView?.tag = 1002
		buttomcollectView?.register(CMMypageReleaseButtomColCell.self, forCellWithReuseIdentifier: "reused1")
 		buttomcollectView?.register(CMMypageRestButtomColCell.self, forCellWithReuseIdentifier: "reused2")
		
		buttomcollectView?.dataSource = self
		buttomcollectView?.delegate = self
		buttomcollectView?.showsHorizontalScrollIndicator = false
		self.contentView.addSubview(buttomcollectView!)
		buttomcollectView?.snp.makeConstraints({ (make) in
			make.left.bottom.right.equalToSuperview()
			make.top.equalTo((headcollectView?.snp.bottom)!)
			
			
		})
		
	}
}

extension CMMypageOtherMainTableCell:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return 2
		
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		var cell:UICollectionViewCell?
		if collectionView.tag == 1001 {
			cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused", for: indexPath)
			let icon:UIImageView = UIImageView(image: UIImage(named: icons.object(at:indexPath.row) as! String)?.withRenderingMode(.alwaysOriginal))
			cell?.contentView.addSubview(icon)
			icon.isUserInteractionEnabled = true
			icon.snp.makeConstraints { (make) in
				make.top.equalTo(15)
				make.centerX.equalToSuperview()
				make.width.height.equalTo(Constant.screenWidth/8.0 )
			}
			
			let title:UILabel = UILabel()
			title.text = titles.object(at: indexPath.row) as? String
			title.textAlignment = .center
			title.textColor = UIColor.colorFromHex(hex: 0x999999)
			title.font = UIFont.systemFont(ofSize: 12)
			cell?.contentView.addSubview(title)
			title.snp.makeConstraints { (make) in
				make.bottom.equalToSuperview()
				make.width.equalTo(Constant.screenWidth/2.0)
				make.top.equalTo(icon.snp.bottom)
			}
			
		}
		else {
			
			switch indexPath.row {
			case 0:
				cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused1", for: indexPath)
				break
			case 1:
				let	cell:CMMypageRestButtomColCell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused2", for: indexPath) as! CMMypageRestButtomColCell
				cell.refreshConstrains()
				return cell
 			default:
				break
			}
			
		}
		
		
		return cell!
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		if collectionView.tag == 1001 {
			let centerX:CGFloat = Constant.screenWidth / 4.0 + (CGFloat(indexPath.row) * (Constant.screenWidth/2.0))
			buttomLine.snp.updateConstraints{ (make) in
				make.centerX.equalTo(centerX)
			}
			buttomcollectView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
		}
	}
	
	
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
		
		var index:Int = Int(scrollView.contentOffset.x / Constant.screenWidth)
		if  (scrollView.contentOffset.x - Constant.screenWidth * CGFloat(index)) > (Constant.screenWidth / 2.0){
			index = index + 1
		}
		buttomcollectView?.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
		let centerX:CGFloat = Constant.screenWidth/4.0 + (CGFloat(index) * (Constant.screenWidth/2.0))
		buttomLine.snp.updateConstraints{ (make) in
			make.centerX.equalTo(centerX)
		}
		print(index)
	}
	
}
