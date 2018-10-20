//
//  CMMypageMainTableCell.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/15.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMMypageMainTableCell: UITableViewCell {
	var headcollectView:UICollectionView?
	var buttomcollectView:UICollectionView?
	

	let icons:NSArray = ["icon_my_moment","icon_my_contacts","icon_find_friends","icon_message_board"]
	let titles:NSArray = ["我的发布".localized(),"通讯录".localized(),"查找好友".localized(),"留言板".localized()]
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
		flowlayout.itemSize = CGSize(width: Constant.screenWidth/4.0 , height: Constant.screenWidth/4.0 + 20.0)
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
		self.contentView.addSubview(headcollectView ?? UICollectionView())
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
			make.centerX.equalTo(Constant.screenWidth/8.0)
		}

		//下方的表
		let tabH:CGFloat = UserDefaults.standard.object(forKey: "tabBarH") as! CGFloat
  		let flowlayout1:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		flowlayout1.itemSize = CGSize(width: Constant.screenWidth , height:2.0 * Constant.screenHeight / 3.0 - Constant.screenWidth/4.0 - 20.0 - tabH )
		flowlayout1.minimumLineSpacing = 0
		flowlayout1.minimumInteritemSpacing = 0
		flowlayout1.scrollDirection = .horizontal

		buttomcollectView?.isPagingEnabled = true
		buttomcollectView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout1)
		buttomcollectView?.backgroundColor =  Constant.vcBgColor
		buttomcollectView?.tag = 1002
		buttomcollectView?.register(CMMypageReleaseButtomColCell.self, forCellWithReuseIdentifier: "reused1")
		buttomcollectView?.register(CMMypageAddressListButtomColCell.self, forCellWithReuseIdentifier: "reused2")
		buttomcollectView?.register(CMMypageFindFriendButtomColCell.self, forCellWithReuseIdentifier: "reused3")
		buttomcollectView?.register(CMMypageRestButtomColCell.self, forCellWithReuseIdentifier: "reused4")

		buttomcollectView?.dataSource = self
		buttomcollectView?.delegate = self
 		buttomcollectView?.showsHorizontalScrollIndicator = false
		self.contentView.addSubview(buttomcollectView ?? UICollectionView())
		buttomcollectView?.snp.makeConstraints({ (make) in
			make.left.bottom.right.equalToSuperview()
			make.top.equalTo((headcollectView?.snp.bottom)!)
 

		})
 
	}
}

extension CMMypageMainTableCell:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return 4

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
				make.width.equalTo(Constant.screenWidth/4.0)
				make.top.equalTo(icon.snp.bottom)
			}

		}
		else {
			
			switch indexPath.row {
			case 0:
				cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused1", for: indexPath)
 				break
			case 1:
				cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused2", for: indexPath)
				break
			case 2:
				cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused3", for: indexPath)
				break
 			case 3:
				cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused4", for: indexPath)
				break
 			default:
				break
			}
			
		}
		

		return cell!
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		if collectionView.tag == 1001 {
			let centerX:CGFloat = Constant.screenWidth / 8.0 + (CGFloat(indexPath.row) * (Constant.screenWidth/4.0))
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
		let centerX:CGFloat = Constant.screenWidth/8.0 + (CGFloat(index) * (Constant.screenWidth/4.0))
		buttomLine.snp.updateConstraints{ (make) in
			make.centerX.equalTo(centerX)
		}
 		print(index)
	}
	
}
