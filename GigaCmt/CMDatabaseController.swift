//
//  CMDatabaseController.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/7.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMDatabaseController: BaseController {
	var rightBtn:UIButton?
	var pop:CMReferRoomNewFileView?
	var submitBtn:UIButton?
	var butoomScrollview:CMBasedataCollectView?
	var clickIndex:CGFloat?
	var isChangeBool:Bool?
	override func viewDidLoad() {
        super.viewDidLoad()
 		addNaviItem()
		addSubViews()
		self.clickIndex = 0
		self.isChangeBool = false
  	}
 
	private func addSubViews(){
		
		self.edgesForExtendedLayout = .bottom
		self.navigationController?.navigationBar.backgroundColor = UIColor.white

		let headView:CMBasedataSegHeadView = CMBasedataSegHeadView()
 		self.view.addSubview(headView)
		headView.snp.makeConstraints { (make) in
			make.left.top.right.equalTo(self.view)
			make.height.equalTo(44)
 		}
		
		let tabH:CGFloat = (self.tabBarController?.tabBar.height)!
		butoomScrollview = CMBasedataCollectView(frame: CGRect(x: 0, y:44, width: Constant.screenWidth, height: Constant.screenHeight - 44 - tabH))
		headView.clickHeadIndexMap = {(index:CGFloat)->Void in
			
			self.clickIndex = index
			self.butoomScrollview?.collectView?.contentOffset.x = index * Constant.screenWidth
			self.isChangeBool = true
			self.submitBtn?.isHidden = true
			self.butoomScrollview?.setEditionState(state: false, index: Int(index))
 
  		}
		self.view.addSubview(butoomScrollview!)
 
 	}
	
	private func addNaviItem(){
		
		let leftBtn:UIButton = UIButton(type: .custom)
		leftBtn.addTarget(self, action:  #selector(leftFunc), for: .touchUpInside)
		leftBtn.setImage(UIImage(named: "icon_upload")?.withRenderingMode(.alwaysOriginal), for: .normal)
		self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBtn)
		
		rightBtn = UIButton(type: .custom)
		rightBtn?.addTarget(self, action:  #selector(rightFunc), for: .touchUpInside)
		rightBtn?.setImage(UIImage(named: "icon_more_operation")?.withRenderingMode(.alwaysOriginal), for: .normal)
		rightBtn?.setImage(UIImage(named: "icon_close_operation")?.withRenderingMode(.alwaysOriginal), for: .selected)
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn!)
		
	}
	@objc private func leftFunc(sender:UIButton){
		
		rightBtn?.isSelected = false
 		if self.isChangeBool! {
 			sender.isSelected = true
			self.isChangeBool = false

 		}else{
			sender.isSelected = !sender.isSelected
 
 		}
		self.butoomScrollview?.setEditionState(state:sender.isSelected,index:Int(clickIndex!))
 		pop?.hiddeSuv()
 
		if sender.isSelected {
			submitBtn = UIButton(type: .custom)
			submitBtn?.setTitle("确定传输".localized(), for: .normal)
			submitBtn?.backgroundColor = UIColor.colorFromHex(hex: 0x2b7af2)
			UIApplication.shared.delegate?.window!?.addSubview(submitBtn!)
			submitBtn?.snp.makeConstraints({ (make) in
				make.bottom.left.right.equalToSuperview()
				make.height.equalTo((self.tabBarController?.tabBar.frame.size.height)!)
			})
		}else {
			submitBtn?.isHidden = true
		}

	}
	
	@objc private func rightFunc(sender:UIButton){
		sender.isSelected = !sender.isSelected
		let boundframe:CGRect = rightBtn!.convert((rightBtn?.bounds)!, to: (UIApplication.shared.delegate?.window)!)
		
		switch sender.isSelected {
		case true:
			pop = CMReferRoomNewFileView(frame: CGRect(x: 0, y: boundframe.origin.y+boundframe.height+8, width: Constant.screenWidth, height: Constant.screenWidth/2.0))
			(UIApplication.shared.delegate?.window)!?.addSubview(pop!)
			pop?.tapCoverMap = {
				self.rightBtn?.isSelected = false
			}
			
			pop?.uploadMap = {  (index:Int) in
 				self.pop?.hiddeSuv()
			}
 			break
			
		case false:
			pop?.hiddeSuv()
			break
		}
		
	}

	
}
