//
//  CMMyPageController.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/7.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMMyPageController: BaseController {
 	var tableview:CMMypageMainTable?
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
		self.navigationController?.navigationBar.shadowImage = UIImage();
 	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
		self.navigationController?.navigationBar.shadowImage = nil
 
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		addSubviews()
		addNaviItem()
	}
	
	private func addNaviItem(){
		
		self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "icon_change_bg")?.withRenderingMode(.alwaysOriginal), style: .plain, target:self , action: #selector(changePic))
		
		self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "icon_release")?.withRenderingMode(.alwaysOriginal), style: .plain, target:self , action: #selector(releaseSym))
 
	}
	
	@objc private func changePic(){
		
		if UIImagePickerController.isSourceTypeAvailable(.camera){
			let picker = UIImagePickerController()
			picker.delegate = self
			picker.allowsEditing = true
			picker.sourceType = UIImagePickerControllerSourceType.camera
			self.present(picker, animated: true, completion: { () -> Void in
			})
		}
		
	}
	
	@objc private func releaseSym(){
		let release:CMMypageReleaseController = CMMypageReleaseController()
		release.hidesBottomBarWhenPushed = true
		self.navigationController?.pushViewController(release, animated: true)
	}

	private func addSubviews(){
		tableview = CMMypageMainTable()
		tableview?.layer.backgroundColor = UIColor.brown.cgColor
		self.view.insertSubview(tableview!, at: 0)
		tableview?.snp.makeConstraints { (make) in
			make.left.right.equalToSuperview()
			make.bottom.equalToSuperview().offset(-((self.navigationController?.navigationBar.height)! + UIApplication.shared.statusBarFrame.size.height ))
			make.top.equalTo(-((self.navigationController?.navigationBar.height)! + UIApplication.shared.statusBarFrame.size.height))
		}
	}

}


extension CMMyPageController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
	
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		
		let pickedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
		tableview?.setTableHeadPicture(image: pickedImage)
 		picker.dismiss(animated: true, completion:nil)

	}
	
	
}
