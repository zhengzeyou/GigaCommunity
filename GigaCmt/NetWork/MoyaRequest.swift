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



class MoyaRequest {

    var	provider = MoyaProvider<MoyaManager>()

	func requestMainData(completion:@escaping ([favShopModel],[favShopModel]) -> Void){
 
		provider.rx.request(.mainData(language: "chn",token:"",customcode:"")).subscribe(onSuccess: { response in
			
			let str = String(data: response.data, encoding: String.Encoding.utf8)
 			if let mainmodel = JSONDeserializer<mainModel>.deserializeFrom(json: str){
				completion(mainmodel.dataFav!,mainmodel.data!)
			}
		},onError: { error in
			print("数据请求失败!错误原因：", error)

		}).disposed(by:Constant.dispose)


	}
}
