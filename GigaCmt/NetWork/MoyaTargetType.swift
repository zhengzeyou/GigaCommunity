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


enum MoyaTargetType {
	
	case mainData(language:String,token:String,customcode:String)
	
}

struct MoyaParamter {
	
}

//实现moya的TargetType协议
extension MoyaTargetType:TargetType{

	var baseURL: URL {
		return URL(string: Constant.mallBaseUrl)!
	}
	
 	var path:String{
		
		switch self {
		case .mainData(language:_ ,token: _,customcode: _):
			return "StoreCate/requestStoreCate1FavList"
		}
		
	}
	
	var headers: [String: String]? {
		return nil;
	}
 	var parameters: [String: Any]? {
		switch self {
		case .mainData(language: let languageValue,token:let tokenValue,customcode: let customCodeValue):
			return ["lang_type":languageValue,"token":tokenValue,"custom_code":customCodeValue]
		}
		
	}
	
 	var method: Moya.Method {
		switch self {
		case .mainData(language:_ ,token: _,customcode: _):
			return .post
		}
	}
	
 	var parameterEncoding: ParameterEncoding {
		return URLEncoding.default
	}
	
 	var sampleData: Data {
		return "".data(using: String.Encoding.utf8)!
	}
	
 	var task: Task {
		switch self {
 		case .mainData(let language,let token,let customcode):
			return .requestParameters(parameters: ["lang_type":language,"token":token,"custom_code":customcode], encoding: URLEncoding.default)
		}
 	}

	var validate: Bool {
		return false

	}
	
	

}

