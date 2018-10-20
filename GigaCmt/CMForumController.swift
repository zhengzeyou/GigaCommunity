//
//  CMForumController.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/7.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMForumController: BaseController {
	var headcollectView:UICollectionView?
	var buttomcollectView:UICollectionView?
  	let titles:NSArray = ["所有讨论".localized(),"公开讨论".localized(),"匿名讨论".localized()]
	var buttomLine:UILabel?
	

    override func viewDidLoad() {
        super.viewDidLoad()
 		self.addSubViews()
		
    }

	private func addSubViews(){
		self.edgesForExtendedLayout = .bottom
		self.navigationController?.navigationBar.backgroundColor = UIColor.white

 		//上方的表
		let flowlayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		flowlayout.itemSize = CGSize(width: Constant.screenWidth/3.0 , height: Constant.screenWidth/8.0)
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
		self.view.addSubview(headcollectView!)
		headcollectView?.snp.makeConstraints({ (make) in
			make.top.left.right.equalToSuperview()
 			make.height.equalTo( Constant.screenWidth/8.0)
		})
		
		buttomLine = UILabel(frame: .zero)
		buttomLine?.backgroundColor = Constant.blueColor
		self.view.addSubview(buttomLine!)
		buttomLine?.snp.makeConstraints { (make) in
			make.width.equalTo(60)
			make.height.equalTo(2)
			make.top.equalTo((headcollectView?.snp.bottom)!).offset(-4)
			make.centerX.equalTo(Constant.screenWidth/6.0)
		}
		
		//下方的表
		let tabH:CGFloat = UserDefaults.standard.object(forKey: "tabBarH") as! CGFloat

 		let flowlayout1:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		flowlayout1.itemSize = CGSize(width: Constant.screenWidth , height: Constant.screenHeight - Constant.screenWidth/8.0 - tabH )
		flowlayout1.minimumLineSpacing = 0
		flowlayout1.minimumInteritemSpacing = 0
		flowlayout1.scrollDirection = .horizontal
		
		buttomcollectView?.isPagingEnabled = true
		buttomcollectView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout1)
		buttomcollectView?.backgroundColor =  Constant.vcBgColor
		buttomcollectView?.tag = 1002
		buttomcollectView?.register(CMForumMainColCell.self, forCellWithReuseIdentifier: "reused1")
 		buttomcollectView?.dataSource = self
		buttomcollectView?.delegate = self
		buttomcollectView?.showsHorizontalScrollIndicator = false
		self.view.addSubview(buttomcollectView!)
		buttomcollectView?.snp.makeConstraints({ (make) in
			make.left.right.bottom.equalToSuperview()
 			make.top.equalTo(Constant.screenWidth/8.0)

		})

	}
}


extension CMForumController:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return 3
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		var cell:UICollectionViewCell?
		if collectionView.tag == 1001 {
			cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused", for: indexPath)
			
			let title:UILabel = UILabel()
 			title.text = titles.object(at: indexPath.row) as? String
			title.textAlignment = .center
			title.textColor = Constant.blackColor
			title.font = UIFont.systemFont(ofSize: 15)
			cell?.contentView.addSubview(title)
			title.snp.makeConstraints { (make) in
				make.bottom.equalToSuperview()
				make.width.equalTo(Constant.screenWidth/3.0)
				make.top.equalToSuperview()
			}
			
		}
		else {
			
			cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused1", for: indexPath)
 
			
			
		}
		
		
		return cell!
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		if collectionView.tag == 1001 {
			let centerX:CGFloat = Constant.screenWidth / 6.0 + (CGFloat(indexPath.row) * (Constant.screenWidth/3.0))
			buttomLine?.snp.updateConstraints{ (make) in
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
		let centerX:CGFloat = Constant.screenWidth/6.0 + (CGFloat(index) * (Constant.screenWidth/3.0))
		buttomLine?.snp.updateConstraints{ (make) in
			make.centerX.equalTo(centerX)
		}
		print(index)
	}
	
}
