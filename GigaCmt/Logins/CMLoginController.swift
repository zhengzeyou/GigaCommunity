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

enum ButtonTypes:Int {
	case login
	case register
	case findPwd
	case checkUser
	
	
	init(offset:Int){
		self.init(rawValue:offset)!
		
	}
	
	var Tag:Int? {
		switch self {
		case .login:
			return 1
		case .register:
			return 2
		case .findPwd:
			return 3
		case .checkUser:
			return 4
  		}
		
	}

}

class CMLoginController: BaseController {

  	override func viewDidLoad() {
        super.viewDidLoad()
		addSubViews()

// 		let provider = MoyaProvider<MoyaManager>();
//		provider.rx.request(.login(username: "15627563290", password: "123455"))
//			.subscribe(onSuccess: { response in
//				//数据处理
//				let str = String(data: response.data, encoding: String.Encoding.utf8)
//				print("返回的数据是：", str ?? "")
//			},onError: { error in
//				print("数据请求失败!错误原因：", error)
//			}).disposed(by:Constant.dispose)
		
		
	}
	
	private func addSubViews(){
	
		let logoIcon:UIImageView = UIImageView(image: UIImage(named: "top_logo")?.withRenderingMode(.alwaysOriginal))
		self.view.addSubview(logoIcon)
		logoIcon.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalToSuperview().offset(150)
		}
		
		let userBg:UIView = UIView()
		userBg.layer.cornerRadius = 5
		userBg.layer.masksToBounds = true
		userBg.layer.borderColor = Constant.greyColor.cgColor
		userBg.layer.borderWidth = 1
		self.view.addSubview(userBg)
		userBg.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(logoIcon.snp.bottom).offset(50)
			make.width.equalTo(Constant.screenWidth - 80.0)
			make.height.equalTo(50)
		}
		
		let inputUse:UITextField = UITextField()
		inputUse.placeholder = "输入用户名"
		inputUse.tintColor = Constant.greyColor
 		userBg.addSubview(inputUse)
		inputUse.snp.makeConstraints { (make) in
 			make.left.top.equalToSuperview().offset(10)
			make.right.bottom.equalToSuperview().offset(-10)
		}
		
		let pwdBg:UIView = UIView()
		pwdBg.layer.cornerRadius = 5
		pwdBg.layer.masksToBounds = true
		pwdBg.layer.borderColor = Constant.greyColor.cgColor
		pwdBg.layer.borderWidth = 1
		self.view.addSubview(pwdBg)
		pwdBg.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(userBg.snp.bottom).offset(20.0)
			make.width.equalTo(Constant.screenWidth - 80.0)
			make.height.equalTo(50)
		}
		
		let inputpwd:UITextField = UITextField()
		inputpwd.placeholder = "输入密码"
		inputpwd.tintColor = Constant.greyColor
		pwdBg.addSubview(inputpwd)
		inputpwd.snp.makeConstraints { (make) in
			make.left.top.equalToSuperview().offset(10)
			make.right.bottom.equalToSuperview().offset(-10)
		}
		
		
		let findpwdBg:UIView = UIView()
  		self.view.addSubview(findpwdBg)
		findpwdBg.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.equalTo(pwdBg.snp.bottom)
			make.width.equalTo(Constant.screenWidth - 80.0)
			make.height.equalTo(50)
		}
		
		let findpwdBtn:UIButton = UIButton(type: .custom)
		findpwdBtn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
		findpwdBtn.tag = ButtonTypes.findPwd.Tag!
 		findpwdBtn.setTitle("找回密码", for: .normal)
		findpwdBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
		findpwdBtn.setTitleColor(Constant.greyColor, for: .normal)
 		findpwdBg.addSubview(findpwdBtn)
		findpwdBtn.snp.makeConstraints { (make) in
			make.right.equalToSuperview()
			make.centerY.equalToSuperview()
			make.width.equalTo(66)
			make.height.equalTo(30)
		}
		let line:UILabel = UILabel()
		line.backgroundColor = Constant.greyColor
		self.view.addSubview(line)
		line.snp.makeConstraints { (make) in
			make.width.equalTo(1)
			make.centerY.equalTo(findpwdBtn.snp.centerY)
			make.right.equalTo(findpwdBtn.snp.left).offset(-5)
			make.height.equalTo(12)
		}
		
		let checkUserBtn:UIButton = UIButton(type: .custom)
		checkUserBtn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
		checkUserBtn.tag = ButtonTypes.checkUser.Tag!
   		checkUserBtn.setTitle("查找用户名", for: .normal)
		checkUserBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
		checkUserBtn.setTitleColor(Constant.greyColor, for: .normal)
		findpwdBg.addSubview(checkUserBtn)
		checkUserBtn.snp.makeConstraints { (make) in
			make.right.equalTo(line.snp.left).offset(-2)
			make.centerY.equalToSuperview()
			make.width.equalTo(90)
			make.height.equalTo(30)
		}
		
		
		let loginBtn:UIButton = UIButton(type: .custom)
		loginBtn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
		loginBtn.tag = ButtonTypes.login.Tag!
  		loginBtn.layer.cornerRadius = 5
		loginBtn.layer.masksToBounds = true
		loginBtn.setTitle("登录", for: .normal)
		loginBtn.backgroundColor = UIColor.colorFromHex(hex: 0x113981)
 		loginBtn.setTitleColor(Constant.vcBgColor, for: .normal)
		self.view.addSubview(loginBtn)
		loginBtn.snp.makeConstraints { (make) in
			make.right.equalTo(findpwdBg.snp.right)
			make.left.equalTo(findpwdBg.snp.left)
 			make.height.equalTo(50)
			make.top.equalTo(findpwdBg.snp.bottom).offset(60)
		}

		let registerBtn:UIButton = UIButton(type: .custom)
		registerBtn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
		registerBtn.tag = ButtonTypes.register.Tag!
 		registerBtn.layer.cornerRadius = 5
		registerBtn.layer.masksToBounds = true
		registerBtn.layer.borderColor = UIColor.colorFromHex(hex: 0x113981).cgColor
		registerBtn.layer.borderWidth = 1
 		registerBtn.setTitle("注册", for: .normal)
 		registerBtn.setTitleColor(Constant.greyColor, for: .normal)
		self.view.addSubview(registerBtn)
		registerBtn.snp.makeConstraints { (make) in
			make.right.equalTo(findpwdBg.snp.right)
			make.left.equalTo(findpwdBg.snp.left)
			make.height.equalTo(50)
			make.top.equalTo(loginBtn.snp.bottom).offset(20)
		}


	}
	
	
	@objc private func buttonAction(sender:UIButton){
		
		switch sender.tag {
		case ButtonTypes.login.Tag:
			print("登录")
			break
		case ButtonTypes.register.Tag:
			print("注册")
			break
		case ButtonTypes.findPwd.Tag:
			print("找回密码")
			let findpwd:CMFindPwdController = CMFindPwdController()
			let navi:UINavigationController = UINavigationController(rootViewController: findpwd)
 			self.present(navi, animated: true, completion: nil)
			
			break
		case ButtonTypes.checkUser.Tag:
			print("查找用户名")
			let resetPwd:CMResetPwdController = CMResetPwdController()
			let navi:UINavigationController = UINavigationController(rootViewController: resetPwd)
			self.present(navi, animated: true, completion: nil)

			break

		default:
			break
		}
		
	}

	
}
