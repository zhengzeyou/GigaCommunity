//
//  CMMypageInputView.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/10/4.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMMypageInputView: UIView {
	var input:UITextField = UITextField()
	var sendReleaseMap:(String) -> Void = {(content:String) in}

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = UIColor.white
		self.layer.borderColor = UIColor.colorFromHex(hex: 0xe2e2e2).cgColor
		self.layer.borderWidth = 1
		NotificationCenter.default.addObserver(self, selector: #selector(keybordShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keybordHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

 		addSubViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addSubViews(){
 		input.borderStyle = .roundedRect
		input.delegate = self
		input.placeholder = "给朋友说点什么吧~~".localized()
 		input.backgroundColor = UIColor.colorFromHex(hex: 0xe2e2e2)
		self.addSubview(input)
		input.snp.makeConstraints { (make) in
			make.top.left.equalTo(10)
			make.bottom.equalTo(-10)
			make.right.equalTo(-90)
 		}
		
		let sendBtn:UIButton = UIButton(type: .custom)
		sendBtn.addTarget(self, action: #selector(sendAction), for: .touchUpInside)
		sendBtn.layer.cornerRadius = 5
		sendBtn.layer.masksToBounds = true
		sendBtn.backgroundColor = Constant.blueColor
		sendBtn.setTitle("发布".localized(), for: .normal)
		sendBtn.setTitleColor(Constant.vcBgColor, for: .normal)
		self.addSubview(sendBtn)
		sendBtn.snp.makeConstraints { (make) in
			make.top.bottom.equalTo(input)
			make.left.equalTo(input.snp.right).offset(10)
			make.right.equalToSuperview().offset(-10)
		}
	}


	@objc private func sendAction(sender:UIButton){
		
		self.sendReleaseMap(input.text!)
		input.text = ""
 		self.input.resignFirstResponder()

	}
	
	@objc func keybordShow(notification:Notification)  {
		let userinfo: NSDictionary = notification.userInfo! as NSDictionary
		let nsValue = userinfo.object(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue
		let keyboardRec = nsValue.cgRectValue
		let height = keyboardRec.size.height
 		self.snp.updateConstraints { (make) in
			make.bottom.equalTo(-height)
		}
		
	}
	
	@objc func keybordHide(notification:Notification)  {
  		self.snp.updateConstraints { (make) in
			make.bottom.equalToSuperview()
		}
	}

	
 }

extension CMMypageInputView:UITextFieldDelegate{
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		self.input.resignFirstResponder()
		return true
		
	}
}
