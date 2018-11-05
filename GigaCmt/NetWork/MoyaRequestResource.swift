//
//  MoyaRequest.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/10/31.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import HandyJSON

//---------------------------------------Enum-----------------------------------

enum MoyaBaseUriEnum:String{
	
	case mainUri
	var baseUri:URL{
		switch self {
		case .mainUri:
			return URL(string: "http://mall.gigawon.co.kr:8800/api/")!
		}
	}
}

enum MoyaPathEnum:String{
	
	case mainUri
	var pathUri:String{
		switch self {
		case .mainUri:
			return "StoreCate/requestStoreCate1FavList"
		}
	}
}

//--------------------------------------Model-----------------------------------

struct favShopModel:HandyJSON{
	var level1:String?
	var level2:String?
	var level3:String?
	var level_name:String?
	var image_url:String?
}

struct mainModel:HandyJSON{
 	var dataFav:[favShopModel]?
	var data:[favShopModel]?
 	var status:String?
	var flag:String?
 	var msg:String?

	init() {}
}



