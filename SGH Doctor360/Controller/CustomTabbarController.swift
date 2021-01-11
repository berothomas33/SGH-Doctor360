import UIKit

import SideMenu




enum TabbarItemTag: Int {
    case Eventslist = 101
    case NotifacationVc = 102
}

class CustomTabBarController: UITabBarController  ,SideMenuNavigationControllerDelegate {
   
    
    var firstTabbarItemImageView: UIImageView!
    var secondTabbarItemImageView: UIImageView!
    
    var flagprofile = ""
    
    
    private var mainView:UIView = UIView()
     
    
    let chatStackview = MainStackToolbarViews()

    let menuStackView = MainStackToolbarViews()
    let iconStackview = MainStackToolbarViews()
     let iconStackview2 = MainStackToolbarViews()
    
    

    
    var navBar: UINavigationBar = UINavigationBar()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        
        

        self.navigationController?.isNavigationBarHidden = true

               
               
        
             
               
        

       
         createMainView()
      
        
       setupSideMenu()
       
      
        if(self.flagprofile == "a")
        {
//       print("Axa")
      switchToDataTabCont()
        
        
        }
//        let firstItemView = self.tabBar.subviews[0]
//        firstTabbarItemImageView = firstItemView.subviews.first as? UIImageView
//        firstTabbarItemImageView.contentMode = .center
//
//        let secondItemView = self.tabBar.subviews[1]
//        self.secondTabbarItemImageView = secondItemView.subviews.first as? UIImageView
//        self.secondTabbarItemImageView.contentMode = .center
    }
    
    private func animate(_ imageView: UIImageView) {
        UIView.animate(withDuration: 0.1, animations: {
            imageView.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
        }) { _ in
            UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 3.0, options: .curveEaseInOut, animations: {
                imageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: nil)
        }
    }
    
    
    private func setupSideMenu() {
           SideMenuManager.default.menuAnimationBackgroundColor = UIColor.clear
       }
       
    
    
    
    
    
    
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let tabbarItemTag = TabbarItemTag(rawValue: item.tag) else {
            return
        }
        
        switch tabbarItemTag {
        case .Eventslist:
            animate(firstTabbarItemImageView)
        case .NotifacationVc:
            animate(secondTabbarItemImageView)
        }
    }
    
    
    
    
    
    func sideMenuWillAppear(menu: UISideMenuNavigationController, animated: Bool) {
        print("SideMenu Appearing! (animated: \(animated))")
        SideMenuManager.default.menuAnimationBackgroundColor = UIColor.clear
    }
    
    
    
    
    
    
    func setNavigationBar() {
       let screenSize: CGRect = UIScreen.main.bounds




        
        
        
        self.navBar.frame = CGRect(x: 0, y: 0, width: screenSize.width, height:UIScreen.main.bounds.height * 0.1) // Here you can set
        self.navBar.backgroundColor = UIColor.init(named: "#1E5584")

        
        
      
    }

    @objc func done() { // remove @objc for Swift 3

    }
    
    
    
    
    
    
    func switchToDataTab() {
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(switchToDataTabCont), userInfo: nil, repeats: false)
    }

    @objc func switchToDataTabCont(){
     //   tabBarController!.selectedIndex = 1
        
      
        self.tabBarController?.selectedIndex = 2
    }
    
    
    
    
    
    
    
    
    

    
    lazy var stackView: UIStackView = {
          
          
          
          let langs = UserDefaults.standard.value(forKey: "AppleLanguages") as? [String]
          
              
              var imageButton = UIImage(named: "ic_menu") as UIImage?
      
          

          
          
          var bgImageLogo: UIImageView?
          var imageLogo: UIImage = UIImage(named: "app_icon")!
          bgImageLogo = UIImageView(image: imageLogo)
          bgImageLogo!.frame = CGRect(x: 45 , y: 43, width: 35, height: 35)
          iconStackview.addSubview(bgImageLogo!)
          
          
          imageButton = UIImage(named: "ic_menu") as UIImage?
          let buttonChat   = UIButton(type: UIButton.ButtonType.custom) as UIButton
          buttonChat.frame = CGRect(x: 80, y: 43, width: 25, height:25)
          buttonChat.setImage(imageButton, for: .normal)



             buttonChat.addTarget(self, action: #selector(self.leftButtonTouched(_:)), for: .touchUpInside)
          chatStackview.addSubview(buttonChat)
          
          let sv = UIStackView(arrangedSubviews: [menuStackView, iconStackview, chatStackview])
          
          sv.translatesAutoresizingMaskIntoConstraints = false
          sv.axis = .horizontal
          sv.frame = CGRect(x: 0, y: 43, width: mainView.bounds.width, height: 35)
          sv.layer.position = CGPoint(x: 0, y: 0)
          sv.distribution = .fillEqually
          return sv

      }()
    
    
    
    
    
    
    
    
    
    
    

    
    
    
    
    
    
    @objc func rightButtonTouched(_ sender: UIButton) {
        print("amll")
        

       let menu = storyboard!.instantiateViewController(withIdentifier:"RIghtleftMenu") as! SideMenuNavigationController
        present(menu, animated: true, completion: nil)
        
        
        


//
        
        
        
       }
       
       @objc func leftButtonTouched(_ sender: UIButton) {
        print("amll")
        
         SideMenuManager.default.menuAnimationBackgroundColor = UIColor.clear
        
        
        print("amll")
         

        let menu = storyboard!.instantiateViewController(withIdentifier:"RIghtleftMenu") as! SideMenuNavigationController
         present(menu, animated: true, completion: nil)
        
        
        
        
//        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SideMenuTableViewController") as? SideMenuTableViewController
//                                                    {
//
//
//
//
//
//
//
//                                                        let nav = UINavigationController(rootViewController: vc)
//
//
//
//
//                                                        self.present(nav, animated: false, completion: nil)
//
//                                                    }
//
        
        
        
       
//       navigationController?.popViewController(animated: true)
//
//        dismiss(animated: true, completion: nil)


       }
    
    
    
    
    fileprivate func setupView(){
         mainView.addSubview(stackView)
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: mainView.topAnchor),
            stackView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            stackView.leftAnchor.constraint(equalTo: mainView.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: mainView.rightAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 90),
            
            
            ])
       
        
    }
    
    
    
    
    
    
    func createMainView(){
        
        mainView.frame = CGRect.init(x: 0, y:0, width: self.view.bounds.width, height: 90)
        mainView.backgroundColor =  UIColor.init(named: "#1E5584")   //the color of the view
        setupView()
        self.view.addSubview(mainView)
    }
     
    
    
    
    
 
       
    
    
    
   
    
   
    
    
  
}
