//
//  MoyaManager.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/8.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import HandyJSON


//实现moya的TargetType协议
struct MoyaTargetType:TargetType{
	
	var baseURL: URL = URL(string: "http://mall.gigawon.co.kr:8800/api/")!
	
	var path: String

 	var method: Moya.Method = .post
	
	var sampleData: Data = Data()
	
	var task: Task
	
	var headers: [String : String]? = nil
	
	init(paramter:[String:Any],base:MoyaBaseUriEnum,path:MoyaPathEnum) {
		self.task = .requestParameters(parameters: paramter, encoding: URLEncoding.default)
		self.baseURL = base.baseUri
		self.path = path.pathUri
	}

 	func requestData<M:HandyJSON>(failerror:((Error)->Void)?, completion:@escaping (_:M) -> Void ){
		var	provider = MoyaProvider<MoyaTargetType>()
		DispatchQueue.global().async {
			provider.rx.request(self).subscribe(onSuccess: { response in
				
				guard let jsonString = String(data: response.data, encoding: String.Encoding.utf8) else {
					return
				}
				if let model = JSONDeserializer<M>.deserializeFrom(json: jsonString){
					DispatchQueue.main.async {
						completion(model)
					}
					
				} },onError: { error in
					
					failerror!(error)
					
			}).disposed(by:Constant.dispose)
		}
		
		
	}
	
	
	
}

