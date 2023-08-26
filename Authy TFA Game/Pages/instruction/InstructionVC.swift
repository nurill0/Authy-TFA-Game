//
//  InstructionVC.swift
//  Authy TFA Game
//
//  Created by Nurillo Domlajonov on 21/08/23.
//

import UIKit

let textDescr = """
    This app allows you to securely log into our games and create keys for game rooms to play with your friends.
    To use the app, you need to enter your nickname, which must match your profile nickname in the games on our website or in our app.
    Depending on the two-factor authentication selected, choose whether to create a code and whether to scan a QR code when you log in to the game.
    Also, you can create passwords for game rooms on our server to play only with friends, who will have to log in using your password (only for rooms created by you).
    These security measures will help you keep your won prizes, characters, and unlocked challenges and achievements safe.
"""



class InstructionVC: BaseVC {
    
    lazy var infoImgView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "info")
        img.contentMode = .scaleAspectFit
        
        return img
    }()
    
    lazy var descriptiontextView: UITextView = {
        let tv = UITextView()
        tv.text = textDescr
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.isEditable = false
        tv.font = UIFont(name: "Khand-Medium", size: 26)
        tv.backgroundColor = .clear
        tv.textColor = .white
        tv.showsVerticalScrollIndicator = false
        tv.layer.cornerRadius = 20
        tv.layer.borderColor =  #colorLiteral(red: 0, green: 0.2164003253, blue: 0.5540158749, alpha: 1).cgColor
        tv.layer.borderWidth = 3
        tv.textAlignment = .center

        return tv
    }()
    
    lazy var continueBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Continue", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .buttonBgColor()
        btn.layer.cornerRadius = 14
        btn.titleLabel?.font = UIFont(name: "Khand-Medium", size: 40)
        btn.addTarget(self, action: #selector(goNext), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var backBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "backbtn"), for: .normal)
        btn.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        
        return btn
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        checkEnterance()
        configureInstructionUI()
    }
    
    
    @objc func goNext(){
        let vc = NicknameVC()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true) {
            //set userdefaults
            self.userdefaults.setInstruction(isOpened: true)
        }
    }

    
    @objc func goBack(){
        dismiss(animated: true)
        
    }
    
    func checkEnterance(){
        if userdefaults.getInstruction() {
            continueBtn.isHidden = true
            infoImgView.isHidden = true
            backBtn.isHidden = false
        }else{
            continueBtn.isHidden = false
            infoImgView.isHidden = false
            backBtn.isHidden = true
        }
    }
    

}



extension InstructionVC {
    
    fileprivate func configureInstructionUI(){
        nicknameView.isHidden = true
        editBtn.isHidden = true
        frameBtnsView.isHidden = true
        infoImgConst()
        continueBtnConst()
        descTVConst()
        backBtnConst()
    }
    
    fileprivate func infoImgConst(){
        view.addSubview(infoImgView)
        infoImgView.top(view.topAnchor,55)
        infoImgView.centerX(view.centerXAnchor)
        infoImgView.width(56)
        infoImgView.height(60)
    }
    
    fileprivate func continueBtnConst(){
        view.addSubview(continueBtn)
        continueBtn.bottom(view.safeAreaLayoutGuide.bottomAnchor, -10)
        continueBtn.centerX(view.centerXAnchor)
        continueBtn.height(60)
        continueBtn.width(200)
    }
    
    fileprivate func descTVConst(){
        view.addSubview(descriptiontextView)
        descriptiontextView.top(infoImgView.bottomAnchor, 10)
        descriptiontextView.left(view.leftAnchor, 10)
        descriptiontextView.right(view.rightAnchor, -10)
        descriptiontextView.bottom(continueBtn.topAnchor, -20)
    }
    
    fileprivate func backBtnConst(){
        view.addSubview(backBtn)
        backBtn.left(view.leftAnchor, 20)
        backBtn.top(view.topAnchor,55)
        backBtn.height(50)
        backBtn.width(50)
    }
    
    
}
