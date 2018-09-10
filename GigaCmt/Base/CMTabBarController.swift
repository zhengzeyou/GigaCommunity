//
//  CMTabBarController.swift
//  GigaCmt
//
//  Created by dlwpdlr on 2018/9/7.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit

class CMTabBarController: UITabBarController {

	enum Tab:Int {
		case community
		case forum
		case referenceRoom
		case database
		case mypage
		
		init(offset:Int){
			self.init(rawValue:offset)!
			
		}
		
		var image:UIImage?{
			switch self {
			case .community:
				return UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
			case .forum:
				return UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
 			case .referenceRoom:
				return UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
 			case .database:
				return UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
			case .mypage:
				return UIImage(named: "")?.withRenderingMode(.alwaysOriginal)

 			}
		}
		
		var selectimage:UIImage?{
			switch self {
			case .community:
				return UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
			case .forum:
				return UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
			case .referenceRoom:
				return UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
			case .database:
				return UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
			case .mypage:
				return UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
				
			}
		}

		
		var title:String?{
			switch self {
			case .community:
				return "社区"
			case .forum:
				return "论坛"
			case .referenceRoom:
				return "资料室"
 			case .database:
				return "数据库"
 			case .mypage:
				return "我的"

			}
		}
		
	}
    override func viewDidLoad() {
        super.viewDidLoad()

		delegate = self as UITabBarControllerDelegate;
		
		let community = CMCommunityController()
		community.title = Tab.community.title
		let communityNavi = UINavigationController(rootViewController: community)
		
		let forum = CMForumController()
		forum.title = Tab.forum.title
		let forumNavi = UINavigationController(rootViewController: forum)

		let refer = CMReferRoomController()
		refer.title = Tab.referenceRoom.title
		let referNavi = UINavigationController(rootViewController: refer)

		let database = CMDatabaseController()
		database.title = Tab.database.title
		let databaseNavi = UINavigationController(rootViewController: database)

		let mypage = CMMyPageController()
		mypage.title = Tab.mypage.title
		let mypageNavi = UINavigationController(rootViewController: mypage)

		
		
		viewControllers = [communityNavi,forumNavi,referNavi,databaseNavi,mypageNavi]
		tabBar.barTintColor = UIColor.white
		
		
		
		UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.brown], for: .selected)
		
		
		viewControllers?.enumerated().forEach({ (offset, controller) in
			let tab = Tab(offset: offset)
			controller.tabBarItem = UITabBarItem(title: tab.title, image: tab.image, selectedImage: tab.selectimage)
		})
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
}

extension CMTabBarController: UITabBarControllerDelegate {
	
	func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
		return true
 	}

}
