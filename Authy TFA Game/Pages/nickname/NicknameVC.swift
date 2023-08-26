//
//  NicknameVC.swift
//  Authy TFA Game
//
//  Created by Nurillo Domlajonov on 21/08/23.
//

import UIKit

class NicknameVC: UIViewController {
    
    
    lazy var bgImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "bgImage")
        img.contentMode = .scaleAspectFill
        
        return img
    }()
    
    lazy var userImgView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "user")
        img.contentMode = .scaleAspectFit
        
        return img
    }()
    
    lazy var frameView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.layer.borderColor =  #colorLiteral(red: 0, green: 0.2164003253, blue: 0.5540158749, alpha: 1).cgColor
        view.layer.borderWidth = 3
        
        return view
    }()
    
    lazy var textFieldBackImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "tfback")
        img.contentMode = .scaleAspectFit
        
        return img
    }()
    
    lazy var nicknameTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .clear
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 13
        tf.textColor = .black
        tf.textAlignment = .center
        tf.leftView = UIView(frame: CGRect(x: 20, y: 20, width: 20, height: 20))
        tf.leftViewMode = .always
        tf.rightView = UIView(frame: CGRect(x: -20, y: -20, width: -20, height: -20))
        tf.rightViewMode = .always
        tf.font = UIFont(name: "Khand-Medium", size: 24)
        
        
        return tf
    }()
    
    
    lazy var frameDescView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.layer.borderColor =  #colorLiteral(red: 0, green: 0.2164003253, blue: 0.5540158749, alpha: 1).cgColor
        view.layer.borderWidth = 3
        
        return view
    }()
    
    lazy var descLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Your nickname must match your profile nickname in our games"
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.font = UIFont(name: "Khand-SemiBold", size: 36)
        
        return lbl
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
    
    var userdefaults = UserDefaultsManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        checkEnterance()
        configureNicknameUI()
    }
    
    @objc func goNext(){
        if nicknameTF.text == "" {
            userdefaults.setNick(name: "unknown")
        }else{
            userdefaults.setNick(name: nicknameTF.text ?? "unknown")
        }
        let vc = AuthenticatorVC()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true) {
            self.userdefaults.setNickname(isOpened: true)
        }
    }
    
    @objc func goBack(){
        dismiss(animated: true)
        userdefaults.setNick(name: nicknameTF.text ?? "unknown")
       
    }
    
   
    func checkEnterance(){
        
        if userdefaults.getNickname() {
            continueBtn.isHidden = true
            backBtn.isHidden = false
        }else{
            continueBtn.isHidden = false
            backBtn.isHidden = true
        }
    }
    
}



extension NicknameVC {
    
    fileprivate func configureNicknameUI(){
        bgImgVConst()
        userImgConst()
        frameViewConst()
        tfBackImgConst()
        tfConst()
        descFrameConst()
        descLblConst()
        continueBtnConst()
        backBtnConst()
    }
    
    fileprivate func bgImgVConst(){
        view.addSubview(bgImageView)
        bgImageView.top(view.topAnchor)
        bgImageView.right(view.rightAnchor)
        bgImageView.left(view.leftAnchor)
        bgImageView.bottom(view.bottomAnchor, 10)
    }
    
    fileprivate func userImgConst(){
        view.addSubview(userImgView)
        userImgView.top(view.safeAreaLayoutGuide.topAnchor, 85)
        userImgView.centerX(view.centerXAnchor)
        userImgView.height(85)
        userImgView.width(85)
    }
    
    fileprivate func frameViewConst(){
        view.addSubview(frameView)
        frameView.top(userImgView.bottomAnchor)
        frameView.right(view.rightAnchor, -20)
        frameView.left(view.leftAnchor, 20)
        frameView.height(110)
    }
    
    fileprivate func tfBackImgConst(){
        frameView.addSubview(textFieldBackImage)
        textFieldBackImage.top(frameView.topAnchor, 20)
        textFieldBackImage.bottom(frameView.bottomAnchor, -20)
        textFieldBackImage.right(frameView.rightAnchor, -20)
        textFieldBackImage.left(frameView.leftAnchor, 20)
    }
    
    fileprivate func tfConst(){
        frameView.addSubview(nicknameTF)
        nicknameTF.top(textFieldBackImage.topAnchor)
        nicknameTF.bottom(textFieldBackImage.bottomAnchor)
        nicknameTF.right(textFieldBackImage.rightAnchor)
        nicknameTF.left(textFieldBackImage.leftAnchor)
    }
    
    
    fileprivate func descFrameConst(){
        view.addSubview(frameDescView)
        frameDescView.top(frameView.bottomAnchor, 30)
        frameDescView.right(frameView.rightAnchor)
        frameDescView.left(frameView.leftAnchor)
        frameDescView.height(230)
    }
    
    
    fileprivate func descLblConst(){
        frameDescView.addSubview(descLabel)
        descLabel.top(frameDescView.topAnchor, 10)
        descLabel.bottom(frameDescView.bottomAnchor, -10)
        descLabel.right(frameDescView.rightAnchor, -10)
        descLabel.left(frameDescView.leftAnchor, 10)
    }
    
    fileprivate func continueBtnConst(){
        view.addSubview(continueBtn)
        continueBtn.bottom(view.safeAreaLayoutGuide.bottomAnchor, -10)
        continueBtn.centerX(view.centerXAnchor)
        continueBtn.height(60)
        continueBtn.width(200)
    }
    
    fileprivate func backBtnConst(){
        view.addSubview(backBtn)
        backBtn.left(view.leftAnchor, 20)
        backBtn.top(view.topAnchor,55)
        backBtn.height(50)
        backBtn.width(50)
    }
    
}


extension NicknameVC {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(NicknameVC.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
