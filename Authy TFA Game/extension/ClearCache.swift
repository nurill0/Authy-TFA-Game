//
//  AnimationView.swift
//  Authy TFA Game
//
//  Created by Nurillo Domlajonov on 24/08/23.
//

import Foundation
import UIKit
import Lottie


class CoachsItemView: UIView {
    var animationView: AnimationView?

    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    convenience init(boosted: Bool) {
        self.init(frame: .zero)
        self.initAnimations(boosted: boosted)
        
    }
    
    private func initAnimations(boosted: Bool){
        animationView = .init(name: "clear")
        animationView?.frame = self.bounds
        animationView?.animationSpeed = 0.8
        self.addSubview(animationView!)
        if boosted {
            animationView?.play()
        }else{
            animationView?.stop()
        }
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


