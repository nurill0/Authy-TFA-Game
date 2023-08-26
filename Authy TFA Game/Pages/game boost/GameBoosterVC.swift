//
//  GameBoosterVC.swift
//  Authy TFA Game
//
//  Created by Nurillo Domlajonov on 22/08/23.
//

import UIKit

class GameBoosterVC: BaseVC {
    
    var percent = 98
    var first = 10
    var second = 20
    var speed = 1.1
    lazy var centerImg: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "center")
        img.contentMode = .scaleAspectFill
        
        return img
    }()
    
    lazy var boostBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Boost", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .buttonBgColor()
        btn.layer.cornerRadius = 10
        btn.titleLabel?.font = UIFont(name: "Khand-Medium", size: 32)
        btn.addTarget(self, action: #selector(boostGame), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var boostLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: "\(first) MB / \(second) MB")
        attributedString.setColorForText(textForAttribute: "\(first)", withColor: UIColor.buttonBgColor())
        attributedString.setColorForText(textForAttribute: " MB / ", withColor: UIColor.white)
        attributedString.setColorForText(textForAttribute: "\(second)", withColor: UIColor.buttonBgColor())
        attributedString.setColorForText(textForAttribute: " MB", withColor: UIColor.white)
        lbl.font = UIFont(name: "Khand-SemiBold", size: 40)
        lbl.attributedText = attributedString
        lbl.textAlignment = .center
        lbl.textColor = .white
        
        return lbl
    }()
    
    
    lazy var percentLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "\(percent)%"
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.font = UIFont(name: "Khand-SemiBold", size: 90)
        
        return lbl
    }()
    
    lazy var animationView: ClearCache = {
        let view = ClearCache()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureGameBoosterUI()
    }
    
    
    @objc func boostGame(){
        var randFirst = Int.random(in: 1...149)
        var randSecond = Int.random(in: 1...150)
        var randPercent = Int.random(in: 10...100)
        speed+=0.1
        animationView.animationView?.animationSpeed = speed
        
        do {repeat {
            randFirst = Int.random(in: 1...149)
            randSecond = Int.random(in: 1...150)
            first = randFirst
            second = randSecond
            let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: "\(first) MB / \(second) MB")
            attributedString.setColorForText(textForAttribute: "\(first)", withColor: UIColor.buttonBgColor())
            attributedString.setColorForText(textForAttribute: " MB / ", withColor: UIColor.white)
            attributedString.setColorForText(textForAttribute: "\(second)", withColor: UIColor.buttonBgColor())
            attributedString.setColorForText(textForAttribute: " MB", withColor: UIColor.white)
            boostLbl.font = UIFont(name: "Khand-SemiBold", size: 40)
            boostLbl.attributedText = attributedString
        }
            while randFirst > randSecond
        }
        
        
        do {
            
            if percent > randPercent {
                percentLabel.text = "\(randPercent)%"
                percent = randPercent
                if percent == 10 {
                    percent = 99
                }
            }else{
                randPercent = Int.random(in: 10...98)
            }
        }
        
        
        
        animationView.isHidden = false
        animationView.animationView?.play()
    }
    
    
    
}



extension GameBoosterVC {
    
    fileprivate func configureGameBoosterUI(){
        gameboosterBtn.setTitleColor(.white, for: .normal)
        roomkeyBtn.setTitleColor(.black, for: .normal)
        authenticatorBtn.setTitleColor(.black, for: .normal)
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: "\(first) MB / \(second) MB")
        attributedString.setColorForText(textForAttribute: "\(first)", withColor: UIColor.buttonBgColor())
        attributedString.setColorForText(textForAttribute: " MB / ", withColor: UIColor.white)
        attributedString.setColorForText(textForAttribute: "\(second)", withColor: UIColor.buttonBgColor())
        attributedString.setColorForText(textForAttribute: " MB", withColor: UIColor.white)
        boostLbl.font = UIFont(name: "Khand-SemiBold", size: 40)
        boostLbl.attributedText = attributedString
        centerImgConst()
        boostLblConst()
        boostBtnConst()
        percentLblConst()
        clearingAnimation()
    }
    
    
    fileprivate func centerImgConst(){
        view.addSubview(centerImg)
        centerImg.right(view.rightAnchor)
        centerImg.left(view.leftAnchor)
        centerImg.centerY(view.centerYAnchor, -30)
    }
    
    fileprivate func boostLblConst(){
        view.addSubview(boostLbl)
        boostLbl.top(centerImg.bottomAnchor, 20)
        boostLbl.centerX(view.centerXAnchor)
    }
    
    fileprivate func boostBtnConst(){
        view.addSubview(boostBtn)
        boostBtn.top(boostLbl.bottomAnchor, 20)
        boostBtn.width(170)
        boostBtn.height(55)
        boostBtn.centerX(view.centerXAnchor)
    }
    
    
    fileprivate func percentLblConst(){
        view.addSubview(percentLabel)
        //        view.bringSubviewToFront(percentLabel)
        percentLabel.bottom(centerImg.centerYAnchor)
        percentLabel.centerX(view.centerXAnchor)
        
    }
    
    
    fileprivate func clearingAnimation(){
        view.addSubview(animationView)
        animationView.centerY(percentLabel.centerYAnchor)
        animationView.centerX(percentLabel.centerXAnchor)
        animationView.height(300)
        animationView.width(300)
    }
}



extension NSMutableAttributedString {
    
    func setColorForText(textForAttribute: String, withColor color: UIColor) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        
        // Swift 4.2 and above
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        
        // Swift 4.1 and below
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
    
}
