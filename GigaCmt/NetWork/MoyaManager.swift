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
 

var BaseURL:String = "http://www.baidu.com/"

enum MoyaManager {
	
	case login(username:String,password:String)
	
}

//实现moya的TargetType协议
extension MoyaManager:TargetType{
	
	var baseURL: URL {
		
		return URL.init(string: BaseURL)!
	}
	
	//请求路径
	var path:String{
		
		switch self {
		case .login(username: _, password:_):
			return "login/accountLogin"
			
		}
		
	}
	
	var headers: [String: String]? {
		return nil;
	}
	//请求的参数
	var parameters: [String: Any]? {
		switch self {
		case .login(username: let userName, password: let pwd):
			return ["account":userName,"pwd":pwd ];
			
		}
		
	}
	
	///请求方式
	var method: Moya.Method {
		switch self {
		case .login(username: _, password: _):
			return .post;
			
		}
	}
	
	/// The method used for parameter encoding.
	var parameterEncoding: ParameterEncoding {
		return URLEncoding.default
	}
	
	/// Provides stub data for use in testing.
	var sampleData: Data {
		return "".data(using: String.Encoding.utf8)!
	}
	
	//MARK:task type
	var task: Task {
		
		return .requestPlain
	}
	
	var validate: Bool {
		return false

	}

}



