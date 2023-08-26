//
//  AnimationView.swift
//  Authy TFA Game
//
//  Created by Nurillo Domlajonov on 24/08/23.
//

import Foundation
import UIKit
import Lottie


class ClearCache: UIView {
    var animationView: AnimationView?

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        initAnimations()
    }
    
    
    convenience init() {
        self.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func initAnimations(){
        animationView = .init(name: "clear")
        self.addSubview(animationView!)
//        animationView?.frame = self.bounds
        animationView!.centerX(self.centerXAnchor)
        animationView!.centerY(self.centerYAnchor)
        animationView!.top(self.topAnchor)
        animationView!.bottom(self.bottomAnchor)
        animationView!.right(self.rightAnchor)
        animationView!.left(self.rightAnchor)
        animationView?.translatesAutoresizingMaskIntoConstraints = false
        animationView?.animationSpeed = 1.1
//        animationView?.loopMode =     
        animationView?.contentMode = .scaleAspectFill
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


