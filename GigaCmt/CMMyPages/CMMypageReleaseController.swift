//
//  CMMypageReleseController.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/17.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit
import PhotoBrowserSwift

class CMMypageReleaseController: BaseController {
	var picCollectView:UICollectionView?
	var dataArray:NSMutableArray = [""]
	var statebg:UIView?
	var privateBtn:UIButton?
	var publicBtn:UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
 		setNavigationBar()
		addSubviews()
		self.edgesForExtendedLayout = .bottom
 	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		self.navigationController?.navigationBar.backgroundColor = UIColor.clear
 
	}

	private func setNavigationBar(){
 		self.title = "发布动态".localized()
		self.navigationController?.navigationBar.tintColor = Constant.blackColor
		self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
		self.navigationController?.navigationBar.backgroundColor = UIColor.white

		self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon_release_moment")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action:  #selector(targertAction))
	}
	
	private func addSubviews(){
		let text:UITextView = UITextView()
		text.textColor = Constant.greyColor
		text.text = "  说些什么吧~~".localized()
		self.view.addSubview(text)
 		text.snp.makeConstraints { (make) in
			make.top.left.right.equalToSuperview()
			make.height.equalTo(160)
		}
		
 		let flowlayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		flowlayout.itemSize = CGSize(width: Constant.screenWidth/3.0 , height: Constant.screenWidth/3.0 )
		flowlayout.minimumLineSpacing = 0
		flowlayout.minimumInteritemSpacing = 0
		
		picCollectView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
		picCollectView?.backgroundColor =  Constant.vcBgColor
 		picCollectView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "reused")
		picCollectView?.dataSource = self
		picCollectView?.delegate = self
 		picCollectView?.showsHorizontalScrollIndicator = false
		self.view.addSubview(picCollectView!)
		picCollectView?.snp.makeConstraints({ (make) in
			make.left.right.equalToSuperview()
			make.top.equalTo(text.snp.bottom)
			make.height.equalTo(Constant.screenWidth/3.0)
		})

		statebg = UIView(frame: .zero)
 		self.view.addSubview(statebg!)
		statebg?.snp.makeConstraints { (make) in
			make.top.equalTo((self.picCollectView?.snp.bottom)!)
			make.left.right.equalToSuperview()
			make.height.equalTo(40)
		}
		
		privateBtn = UIButton(frame: .zero)
		privateBtn?.addTarget(self, action: #selector(privatePublicaction), for: .touchUpInside)
		privateBtn?.layer.cornerRadius = 12.0
		privateBtn?.layer.masksToBounds = true
		privateBtn?.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
		privateBtn?.setBackgroundImage(UIImage(named: "normal"), for: .normal)
		privateBtn?.setBackgroundImage(UIImage(named: "selected"), for: .selected)
   		privateBtn?.setTitleColor(Constant.greyColor, for: .normal)
		privateBtn?.setTitleColor(Constant.vcBgColor, for: .selected)
		privateBtn?.setTitle("匿名".localized(), for: .normal)
		statebg?.addSubview(privateBtn!)
		privateBtn?.snp.makeConstraints { (make) in
			make.right.equalToSuperview().offset(-15)
			make.centerY.equalToSuperview()
			make.width.equalTo(50)
			make.height.equalTo(24)
		}
		
		publicBtn = UIButton(frame: .zero)
 		publicBtn?.addTarget(self, action: #selector(privatePublicaction), for: .touchUpInside)
 		publicBtn?.layer.cornerRadius = 12.0
		publicBtn?.layer.masksToBounds = true
		publicBtn?.isSelected = true
 		publicBtn?.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
		publicBtn?.setBackgroundImage(UIImage(named: "normal"), for: .normal)
		publicBtn?.setBackgroundImage(UIImage(named: "selected"), for: .selected)
 		publicBtn?.backgroundColor = UIColor.colorFromHex(hex: 0xf2f2f2)
		publicBtn?.setTitleColor(Constant.greyColor, for: .normal)
		publicBtn?.setTitleColor(Constant.vcBgColor, for: .selected)
		publicBtn?.setTitle("公开".localized(), for: .normal)
		statebg?.addSubview(publicBtn!)
		publicBtn?.snp.makeConstraints { (make) in
			make.right.equalTo((privateBtn?.snp.left)!).offset(-10)
			make.centerY.equalToSuperview()
			make.width.equalTo(50)
			make.height.equalTo(24)
		}

		
	}
	
	@objc private func privatePublicaction(sender:UIButton){
		privateBtn?.isSelected = false
		publicBtn?.isSelected = false
		sender.isSelected = !sender.isSelected
	}
	
	@objc private func targertAction(){
		
	}
	
	public func PhotoBrowers(index:Int,photos:NSMutableArray){
		let pbVC:PhotoBrowser = PhotoBrowser.init(photos: photos as! [Photo], currentIndex: index)
		self.present(pbVC, animated: true, completion: nil)

	}
 
}

extension CMMypageReleaseController:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return self.dataArray.count
		
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "reused", for: indexPath)
 
		let bg:UIView = UIView()
		bg.backgroundColor = UIColor.colorFromHex(hex: 0xf2f2f2)
		cell.contentView.addSubview(bg)
		bg.snp.makeConstraints { (make) in
			make.left.top.equalToSuperview().offset(15)
			make.right.bottom.equalToSuperview().offset(-15)

		}
		let icon:UIImageView = UIImageView()
		bg.addSubview(icon)
	
		
		switch indexPath.row {
		case( self.dataArray.count - 1):
			
			icon.image = UIImage(named: "icon_add_pic")?.withRenderingMode(.alwaysOriginal)
 			icon.snp.makeConstraints { (make) in
 				make.centerY.equalToSuperview().offset(-10)
				make.centerX.equalToSuperview()
				make.width.height.equalTo(Constant.screenWidth / 3.0 - 70.0 )
 			}
			
			let addPic:UILabel = UILabel()
			addPic.text = "添加图片".localized()
			addPic.font = UIFont.systemFont(ofSize: 15)
			addPic.textAlignment = .center
 			addPic.textColor = Constant.greyColor
 			bg.addSubview(addPic)
			addPic.snp.makeConstraints { (make) in
				make.top.equalTo(icon.snp.bottom).offset(5)
				make.right.left.equalToSuperview()
			}

  			break
		default:

			
  			icon.snp.updateConstraints { (make) in
 				make.edges.equalToSuperview()
			}
			icon.image = self.dataArray.object(at: indexPath.row) as? UIImage
 
 			break
		}
 
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if indexPath.row == (self.dataArray.count - 1) {
			self.addPhotoes()
		}else{
			let photos:NSMutableArray = []
			for i in 0 ..< (self.dataArray.count - 1) {
				let photo:Photo = Photo(image:self.dataArray.object(at: i) as? UIImage)
 				photos.add(photo)
			}
			PhotoBrowers(index: indexPath.row, photos: photos)
		}
 	}
	
	
	
	private func addPhotoes(){
		let alert = UIAlertController(title:nil, message: nil, preferredStyle: .actionSheet)
		let action = UIAlertAction(title:"相册".localized(), style: .default) { (action)in
			self.choicePhotoes()
		}
		let action1 = UIAlertAction(title:"拍摄".localized(), style: .default) { (action)in
			self.takePhotoes()
		}
		let action2 = UIAlertAction(title:"取消".localized(), style: .cancel, handler:nil)
		alert.addAction(action)
		alert.addAction(action1)
		alert.addAction(action2)
		alert.popoverPresentationController?.sourceView =  self.view
		alert.popoverPresentationController?.sourceRect = CGRect(origin:self.view.center, size: CGSize(width:1, height: 1))
		self.present(alert, animated:true, completion: nil)
	}
	
	private func choicePhotoes(){
		if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
			let picker = UIImagePickerController()
			picker.delegate = self
			picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
			self.present(picker, animated: true, completion: { () -> Void in
			})
		}
	}
	private func takePhotoes(){
		if UIImagePickerController.isSourceTypeAvailable(.camera){
			let picker = UIImagePickerController()
			picker.delegate = self
			picker.sourceType = UIImagePickerControllerSourceType.camera
			self.present(picker, animated: true, completion: { () -> Void in
			})
		}
		
	}
}

extension CMMypageReleaseController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{

	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		
		let pickedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
 		if self.dataArray.count < 10 {
			self.dataArray.insert(pickedImage, at: (self.dataArray.count-1))
 		}

		var sections:Int?
		sections = Int(self.dataArray.count / 3)
		if self.dataArray.count % 3 != 0 {
			sections = sections! + 1
		}
		self.picCollectView?.snp.updateConstraints({ (make) in
			make.height.equalTo(CGFloat(sections!) * Constant.screenWidth/3.0)
		})

		self.picCollectView?.reloadData()

		//图片控制器退出
		picker.dismiss(animated: true, completion:nil)

	}
	

 }
