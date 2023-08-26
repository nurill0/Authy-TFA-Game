//
//  BaseVC.swift
//  Gym Team Fit
//
//  Created by Nurillo Domlajonov on 09/08/23.
//

import UIKit
import AVFAudio
import AVFoundation

class BaseVC: UIViewController {

    
    lazy var bgImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "bgImage")
        img.contentMode = .scaleAspectFill
        
        return img
    }()
    
    lazy var nicknameView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = .buttonBgColor()
        
        return view
    }()
    
    lazy var nicknameBgImg: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "tfback")
        img.contentMode = .scaleAspectFit
        
        return img
    }()
    
    lazy var nickNameLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = userdefaults.getNick()
        lbl.textAlignment = .left
        lbl.textColor = .black
        lbl.font = UIFont(name: "Khand-Medium", size: 20)
        
        return lbl
    }()
    
    
    lazy var editBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "editBtn"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        btn.addTarget(self, action: #selector(goEdit), for: .touchUpInside)
        
        return btn
    }()
    
    
    
    lazy var frameBtnsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.layer.borderColor =  #colorLiteral(red: 0.8739383817, green: 0.898853004, blue: 0.9370648265, alpha: 1).cgColor
        view.layer.borderWidth = 1
        view.backgroundColor = .white.withAlphaComponent(0.42)
        
        return view
    }()
    
    lazy var roomkeyBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Room key", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .buttonBgColor()
        btn.layer.cornerRadius = 10
        btn.titleLabel?.font = UIFont(name: "Khand-Medium", size: 28)
        btn.tag = 1
        btn.addTarget(self, action: #selector(goPages), for: .touchUpInside)

        return btn
    }()
    
    
    lazy var authenticatorBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Authenticator", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .buttonBgColor()
        btn.layer.cornerRadius = 10
        btn.titleLabel?.font = UIFont(name: "Khand-Medium", size: 28)
        btn.tag = 2
        btn.addTarget(self, action: #selector(goPages), for: .touchUpInside)

        return btn
    }()
    
    lazy var gameboosterBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Game booster", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .buttonBgColor()
        btn.layer.cornerRadius = 10
        btn.titleLabel?.font = UIFont(name: "Khand-Medium", size: 28)
        btn.tag = 3
        btn.addTarget(self, action: #selector(goPages), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var textFieldBgView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 25
        view.backgroundColor = .buttonBgColor()
        view.isHidden = true
        
        return view
    }()
    
    let userdefaults = UserDefaultsManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nickNameLbl.text = userdefaults.getNick()
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        nickNameLbl.text = userdefaults.getNick()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nickNameLbl.text = userdefaults.getNick()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        nickNameLbl.text = userdefaults.getNick()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        nickNameLbl.text = userdefaults.getNick()
    }
    
//
    
//    func playAudio() {
//        var audioPlayer = AVAudioPlayer()
//        let url = Bundle.main.url(forResource: "tapSound", withExtension: "mp3")
//        audioPlayer = try! AVAudioPlayer(contentsOf: url!)
//        audioPlayer.play()
//    }
    
//
//    @objc func backPreviousVC(){
//        dismiss(animated: true)
//        playAudio()
//    }
    
    
    @objc func goPages(sender: UIButton){
        var vc = UIViewController()
        switch sender.tag {
        case 1: vc = RoomKeyVC()
            roomkeyBtn.setTitleColor(.white, for: .normal)
            authenticatorBtn.setTitleColor(.black, for: .normal)
            gameboosterBtn.setTitleColor(.black, for: .normal)
        case 2: vc = AuthenticatorVC()
            authenticatorBtn.setTitleColor(.white, for: .normal)
            roomkeyBtn.setTitleColor(.black, for: .normal)
            gameboosterBtn.setTitleColor(.black, for: .normal)
        case 3: vc = GameBoosterVC()
            gameboosterBtn.setTitleColor(.white, for: .normal)
            authenticatorBtn.setTitleColor(.black, for: .normal)
            roomkeyBtn.setTitleColor(.black, for: .normal)
        default: vc = UIViewController()
        }
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
    @objc func goEdit(){
        let vc = NicknameVC()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

    
    
}



extension BaseVC {
    
    
    fileprivate func configureUI(){
        self.view.backgroundColor = .baseBgColor()
        bgImgVConst()
        nicknameViewConst()
        editBtnConst()
        nicknameBgConst()
        nickNameLblConst()
        frameBtnsConst()
        roomkeyBtnConst()
        authenticatorBtnConst()
        gameboosterBtnConst()
    }
    
    
    fileprivate func bgImgVConst(){
        view.addSubview(bgImageView)
        bgImageView.top(view.topAnchor)
        bgImageView.right(view.rightAnchor)
        bgImageView.left(view.leftAnchor)
        bgImageView.bottom(view.bottomAnchor, 10)
    }
    
    fileprivate func nicknameViewConst(){
        view.addSubview(nicknameView)
        nicknameView.top(view.topAnchor, 60)
        nicknameView.right(view.rightAnchor, -60)
        nicknameView.height(50)
        nicknameView.width(140)
    }
    
    fileprivate func nicknameBgConst(){
        nicknameView.addSubview(nicknameBgImg)
        nicknameBgImg.centerY(nicknameView.centerYAnchor)
        nicknameBgImg.centerX(nicknameView.centerXAnchor)
        nicknameBgImg.width(120)
        nicknameBgImg.height(35)
    }
    
    fileprivate func nickNameLblConst(){
        nicknameBgImg.addSubview(nickNameLbl)
        nickNameLbl.centerY(nicknameBgImg.centerYAnchor)
        nickNameLbl.left(nicknameBgImg.leftAnchor, 10)
        nickNameLbl.right(nicknameBgImg.rightAnchor, -5)
    }
    
    
    fileprivate func editBtnConst(){
        view.addSubview(editBtn)
        editBtn.right(view.rightAnchor, -5)
        editBtn.centerY(nicknameView.centerYAnchor)
        editBtn.height(50)
        editBtn.width(50)
    }
    
    
    fileprivate func frameBtnsConst(){
        view.addSubview(frameBtnsView)
        frameBtnsView.bottom(view.safeAreaLayoutGuide.bottomAnchor, -20)
        frameBtnsView.right(view.rightAnchor, -20)
        frameBtnsView.left(view.leftAnchor, 20)
        frameBtnsView.height(130)
    }
    
    fileprivate func roomkeyBtnConst(){
        frameBtnsView.addSubview(roomkeyBtn)
        roomkeyBtn.top(frameBtnsView.topAnchor, 10)
        roomkeyBtn.centerX(frameBtnsView.centerXAnchor)
        roomkeyBtn.height(50)
        roomkeyBtn.width(150)
    }
    
    fileprivate func authenticatorBtnConst(){
        frameBtnsView.addSubview(authenticatorBtn)
        authenticatorBtn.top(roomkeyBtn.bottomAnchor, 10)
        authenticatorBtn.left(frameBtnsView.leftAnchor, 10)
        authenticatorBtn.height(50)
        authenticatorBtn.width(150)
    }
    
    fileprivate func gameboosterBtnConst(){
        frameBtnsView.addSubview(gameboosterBtn)
        gameboosterBtn.top(roomkeyBtn.bottomAnchor, 10)
        gameboosterBtn.right(frameBtnsView.rightAnchor, -10)
        gameboosterBtn.height(50)
        gameboosterBtn.width(150)
    }
    
    
}
