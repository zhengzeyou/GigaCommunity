//
//  CMLoginController.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/7.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit
import Moya
import RxSwift

class CMLoginController: BaseController {

  	override func viewDidLoad() {
        super.viewDidLoad()

 		let provider = MoyaProvider<MoyaManager>();
		provider.rx.request(.login(username: "15627563290", password: "123455"))
			.subscribe(onSuccess: { response in
				//数据处理
				let str = String(data: response.data, encoding: String.Encoding.utf8)
				print("返回的数据是：", str ?? "")
			},onError: { error in
				print("数据请求失败!错误原因：", error)
			}).disposed(by:Constant.dispose)
		
		
	}
	

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

	
}
