//
//
//  Created by Nurillo Domlajonov on 17/10/22.
//

import Foundation
import UIKit


final class AppLauncher{
    
    private(set) var window: UIWindow
    
    @available(iOS 13.0, *)
    init(windowScene: UIWindowScene) {
        window = UIWindow(windowScene: windowScene)
        setup()
       
    }
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
        setup()
      
    }
    
    fileprivate func setup() {
        configureInitials()
    }
    
    fileprivate func configureInitials(){
        
    }
    
    func showMainPage() {
        let navCtrl = createNavCtrl(rootVC: LaunchVC())
        window.rootViewController = navCtrl
        window.makeKeyAndVisible()
    }
}
