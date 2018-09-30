//
//  CMMypageOtherReleaseController.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/18.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMMypageOtherReleaseController: UIViewController {
	
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
 		setNavigationBar()
		addSubviews()
 	}

	private func setNavigationBar(){
 		self.navigationController?.navigationBar.tintColor = Constant.vcBgColor
		self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
 
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon_add_friends")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action:  #selector(rightaction))
	}
	
	@objc private func rightaction(){
		
	}
	
	private func addSubviews(){
		
		let tableview:CMMypageOtherMainTable = CMMypageOtherMainTable()
		tableview.layer.backgroundColor = UIColor.brown.cgColor
		self.view.insertSubview(tableview, at: 0)
		tableview.snp.makeConstraints { (make) in
 			make.left.bottom.right.equalToSuperview()
 			make.top.equalTo(-((self.navigationController?.navigationBar.height)! + UIApplication.shared.statusBarFrame.size.height))
		}
	}

}
