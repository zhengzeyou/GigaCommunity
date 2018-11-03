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

	static let dispose = DisposeBag()
	func requestData<M:HandyJSON>(type:MoyaTargetType,failerror:((Error)->Void)?, completion:@escaping (_:M) -> Void ){
		var	provider = MoyaProvider<MoyaTargetType>()
		DispatchQueue.global().async {
			provider.rx.request(type).subscribe(onSuccess: { response in
				
				let jsonString = String(data: response.data, encoding: String.Encoding.utf8)
				if let model = JSONDeserializer<M>.deserializeFrom(json: jsonString){
					DispatchQueue.main.async {
						completion(model)
 					}
					
				} },onError: { error in
					
					failerror!(error)
					
			}).disposed(by:MoyaRequest.dispose)
		}


	}
	
}
