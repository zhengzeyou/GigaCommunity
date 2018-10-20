//
//  CMReferRoomController.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/7.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMReferRoomController: BaseController {
	var rightBtn:UIButton?
	var table:CMReferRoomMainTable?
 	var pop:CMReferRoomNewFileView?
	var submitBtn:UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
		addNaviItem()
		addTableView();
	}
	private func addTableView(){
		self.table = CMReferRoomMainTable(frame: .zero)
		self.view.addSubview(table!)
		table?.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
 		}
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
		sender.isSelected = !sender.isSelected
		pop?.hiddeSuv()
		table?.setEditState(state: sender.isSelected)
		
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
	
	private func uploadImage(type:Int){
		guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary)else{ 
			print("无法获得相册授权")
			return
		}
		let picker = UIImagePickerController()
		picker.allowsEditing = false   //不允许编辑图片
		switch type {
		case 0:
			picker.sourceType = .photoLibrary
 			break
		case 1:
			picker.sourceType = .camera
			break
 		default:
			break
		}
		picker.delegate = self   //设置代理
		self.present(picker, animated: true, completion: nil)//以模态视图弹出选
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
				self.uploadImage(type: index)
				self.pop?.hiddeSuv()
 			}

   			break
			
		case false:
  			pop?.hiddeSuv()
  			break
		}
 
	}
 }

extension CMReferRoomController :UIImagePickerControllerDelegate,UINavigationControllerDelegate {
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
 
		dismiss(animated: true, completion: nil)
	}
	
 }
