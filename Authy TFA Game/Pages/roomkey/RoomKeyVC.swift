//
//  RoomKeyVC.swift
//  Authy TFA Game
//
//  Created by Nurillo Domlajonov on 22/08/23.
//

import UIKit

class RoomKeyVC: BaseVC {
    
    var keyCode = 000000
    
    lazy var centerImg: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "center")
        img.contentMode = .scaleAspectFill
        
        return img
    }()

    
    lazy var frameView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.layer.borderColor =  #colorLiteral(red: 0.2403740585, green: 0.5999547243, blue: 0.9316031337, alpha: 1).cgColor
        view.layer.borderWidth = 3
        
        return view
    }()
    
    lazy var generateBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Generate key", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .buttonBgColor()
        btn.layer.cornerRadius = 14
        btn.titleLabel?.font = UIFont(name: "Khand-SemiBold", size: 32)
        btn.addTarget(self, action: #selector(generateCode), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var keyTf: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.text = ""
        tf.textAlignment = .center
        tf.textColor = .black
        tf.backgroundColor = .white
        tf.font = UIFont(name: "Khand-SemiBold", size: 44)
        tf.isUserInteractionEnabled = false
        tf.layer.cornerRadius = 13
        
        return tf
    }()
    
    lazy var copyBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Copy", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .buttonBgColor()
        btn.layer.cornerRadius = 10
        btn.titleLabel?.font = UIFont(name: "Khand-Medium", size: 28)
        btn.addTarget(self, action: #selector(copyCode), for: .touchUpInside)
        
        return btn
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configreRoomkeyUI()
    }
    
    
}



//actions
extension RoomKeyVC {
    
        
    //generate 6 digit numbers  when generate tapped
    @objc func generateCode(){
        keyCode = Int.random(in: 100000...999999)
        keyTf.text = "\(keyCode)"
    }
    
    //copy textfield text to clipboard when copyBtn tapped
    @objc func copyCode(){
        guard let key = keyTf.text, !key.isEmpty else {return}
        UIPasteboard.general.string = key
    }
    
}



//UI
extension RoomKeyVC {
    
    fileprivate func configreRoomkeyUI(){
        textFieldBgView.isHidden = false
        roomkeyBtn.setTitleColor(.white, for: .normal)
        authenticatorBtn.setTitleColor(.black, for: .normal)
        gameboosterBtn.setTitleColor(.black, for: .normal)
        centerImgConst()
        frameViewCOnst()
        generetkeyBtnConst()
        tfBgConst()
        keyTFConst()
        copyBtnConst()
    }
    
    
    fileprivate func centerImgConst(){
        view.addSubview(centerImg)
        centerImg.right(view.rightAnchor)
        centerImg.left(view.leftAnchor)
        centerImg.centerY(view.centerYAnchor, -70)
    }
    
    
    fileprivate func frameViewCOnst(){
        view.addSubview(frameView)
        frameView.centerY(centerImg.centerYAnchor)
        frameView.right(view.rightAnchor, -20)
        frameView.left(view.leftAnchor, 20)
        if view.frame.height > 670{
            frameView.height(270)
        }else{
            frameView.height(210)
        }
    }
    
    
    fileprivate func generetkeyBtnConst(){
        view.addSubview(generateBtn)
        generateBtn.centerY(frameView.topAnchor)
        generateBtn.left(frameView.leftAnchor, 35)
        generateBtn.right(frameView.rightAnchor, -35)
        generateBtn.height(60)
    }
    
    
    fileprivate func tfBgConst(){
        view.addSubview(textFieldBgView)
        textFieldBgView.centerY(frameView.centerYAnchor)
        textFieldBgView.right(generateBtn.rightAnchor)
        textFieldBgView.left(generateBtn.leftAnchor)
        if view.frame.height > 670{
            textFieldBgView.height(120)
        }else{
            textFieldBgView.height(100)
        }
    }
    
    
    fileprivate func keyTFConst(){
        textFieldBgView.addSubview(keyTf)
        keyTf.top(textFieldBgView.topAnchor, 20)
        keyTf.bottom(textFieldBgView.bottomAnchor, -20)
        keyTf.right(textFieldBgView.rightAnchor, -20)
        keyTf.left(textFieldBgView.leftAnchor, 20)
    }
    
    
    fileprivate func copyBtnConst(){
        view.addSubview(copyBtn)
        copyBtn.centerY(frameView.bottomAnchor)
        copyBtn.centerX(frameView.centerXAnchor)
        copyBtn.height(50)
        copyBtn.width(165)
    }
    
}
