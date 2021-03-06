//
//  Constant.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/8.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit
import RxSwift
 

struct Constant {
	
	static let dispose = DisposeBag()
	static let screenWidth = UIScreen.main.bounds.size.width
	static let screenHeight = UIScreen.main.bounds.size.height
 	static let blackColor:UIColor = UIColor.colorFromHex(hex: 0x111111)
	static let greyColor:UIColor = UIColor.colorFromHex(hex: 0x999999)
 	static let vcBgColor:UIColor = UIColor.colorFromHex(hex: 0xfffffe)
	static let blueColor:UIColor = UIColor.colorFromHex(hex: 0x113981)
	static let greenColor:UIColor = UIColor.colorFromHex(hex: 0x479f2f)

	static let mallBaseUrl:String = "http://mall.gigawon.co.kr:8800/api/"

}
 
