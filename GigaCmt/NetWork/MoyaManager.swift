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
  public typealias JSONDictionary = [String: Any]

enum MoyaManager {
	
	case login(account:String,pwd:String)
	case mainData(language:String,token:String,customcode:String)
	
}

//实现moya的TargetType协议
extension MoyaManager:TargetType{
	
	var baseURL: URL {
		return URL(string: Constant.mallBaseUrl)!
	}
	
 	var path:String{
		
		switch self {
		case .login(account: _, pwd: _):
			return ""
		case .mainData(language:_ ,token: _,customcode: _):
			return "StoreCate/requestStoreCate1FavList"
		}
		
	}
	
	var headers: [String: String]? {
		return nil;
	}
 	var parameters: [String: Any]? {
		switch self {
		case .login(account: let account, pwd: let pwd):
			return ["account":account,"pwd":pwd ]
		case .mainData(language:_,token:_,customcode: _):
			return ["lang_type":"chn","token":"","custom_code":""]
		}
		
	}
	
 	var method: Moya.Method {
		switch self {
		case .login(account: _, pwd: _):
			return .get;
		default:
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
		case .login(let account, let pwd):
			return .requestParameters(parameters: ["account":account,"pwd":pwd ], encoding: URLEncoding.default)
		case .mainData(let language,let token,let customcode):
			return .requestParameters(parameters: ["lang_type":language,"token":token,"custom_code":customcode], encoding: URLEncoding.default)
		}
 	}
	
	var validate: Bool {
		return false

	}

}

