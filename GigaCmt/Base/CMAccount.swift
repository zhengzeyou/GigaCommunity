//
//  CMAccount.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/8.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMAccount: NSObject {
	var token:String? = ""
	var phone:String = ""
	var password:String = ""
	var nick:String = ""
	
	static let instance: CMAccount = CMAccount()
 	class func sharedCMAccount() -> CMAccount {
		return instance
	}
	
	func setContent(token:String,phone:String,password:String,nick:String) {
		
		self.phone = phone
		self.nick = nick
		self.password = password
		self.token = token
	}
	

	func changeloginOutStatus(tokenStr:String?){
		
		CMAccount.sharedCMAccount().token = tokenStr
 		guard CMAccount.sharedCMAccount().token != nil else {
			
			UIApplication.shared.delegate?.window??.rootViewController = CMLoginController()
			UIApplication.shared.delegate?.window??.makeKeyAndVisible()
			
			return ;
		}
		UIApplication.shared.delegate?.window??.rootViewController = CMTabBarController()
		UIApplication.shared.delegate?.window??.makeKeyAndVisible()
	}
	
}
