//
//
//  Created by Nurillo Domlajonov on 17/10/22.
//

import Foundation
import UIKit


final class AppLauncher{
    
    var userDefaults = UserDefaultsManager.shared
    
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
        var navCtrl = createNavCtrl(rootVC: UIViewController())

        if userDefaults.getInstruction(){
            navCtrl = createNavCtrl(rootVC: AuthenticatorVC())
        }else{
            navCtrl = createNavCtrl(rootVC: InstructionVC())
        }
        window.rootViewController = navCtrl
        window.makeKeyAndVisible()
    }
}
