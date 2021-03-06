//
//  CMCommunityController.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/7.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit
import RxSwift


class CMCommunityController: BaseController {

	var cmScrollView:UIScrollView?
	var badge:UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
 		headView()
		CmScrollView()
	
		let params:[String:Any] = ["language": "chn", "token": "", "customcode": ""]
		let target = MoyaTargetType(paramter:params ,method:.post, base:.mainUri, path:.mainUri)
		target.requestData(failerror: nil) { (model:mainModel) in
			guard model.status == "1" else{
				return
			}
			
			print(model.dataFav?.count)
			print(model.data?.count)

		}
		
		



     }

	
	private func headView(){
		let rightbtn:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
		rightbtn.addTarget(self, action: #selector(Ling), for:.touchUpInside)
		rightbtn.setImage(UIImage(named: "icon_message")?.withRenderingMode(.alwaysOriginal), for: .normal)
 		self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightbtn)
		
		badge = UILabel()
		badge?.layer.cornerRadius = 6
		badge?.layer.masksToBounds = true
		badge?.backgroundColor = UIColor.red
		rightbtn.addSubview(badge ?? UILabel())
		badge?.snp.makeConstraints { (make) in
			make.top.equalToSuperview().offset(-2)
			make.width.height.equalTo(12)
			make.right.equalToSuperview().offset(3)
		}
 
		let cmTopSeg:CMTopSegView = CMTopSegView.init(frame: CGRect(x: 0, y: 0, width: 120, height: 40))
		cmTopSeg.clickHeadIndexMap = {[weak self](index:CGFloat)->Void in
			
			self?.cmScrollView?.contentOffset.x = index*Constant.screenWidth
 
		}
		self.navigationItem.titleView = cmTopSeg
 
 	}
	
	
	@objc private func Ling(sender:UIButton){
		print("铃声 ~~~ ")
	}
	
	
}
extension CMCommunityController:UIScrollViewDelegate{
	
 	private func CmScrollView(){
		
		UserDefaults.standard.set(self.tabBarController?.tabBar.height, forKey: "tabBarH")
		UserDefaults.standard.synchronize()
 
		cmScrollView = UIScrollView(frame: .zero)
		cmScrollView?.delegate = self
		cmScrollView?.isScrollEnabled = false
 		cmScrollView?.contentSize = CGSize(width: Constant.screenWidth*2, height: Constant.screenHeight)
		view.addSubview(cmScrollView!)
  		cmScrollView?.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
 		}
		
		let tableHeight:CGFloat = Constant.screenHeight - (self.tabBarController?.tabBar.height)! - 10.0
		
		let jmTableview = CMJmTableView(frame: CGRect(x: 0, y: 0, width: Constant.screenWidth, height: tableHeight))
		cmScrollView?.addSubview(jmTableview)
		
		let perTableview = CMPerTableView(frame: CGRect(x: Constant.screenWidth, y: 0, width: Constant.screenWidth, height:tableHeight))
		cmScrollView?.addSubview(perTableview)

 	}
}
