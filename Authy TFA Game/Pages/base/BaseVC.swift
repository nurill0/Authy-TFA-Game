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
    
    let userDM = UserDefaultsManager.shared
    
    lazy var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .baseColor()
        
        return view
    }()
    
    lazy var bgImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "locker")
        img.contentMode = .scaleAspectFill
        
        return img
    }()
    
    
    lazy var idView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        
        return view
    }()
    
    lazy var playerIDLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Player ID"
        lbl.textAlignment = .left
        lbl.textColor = .black
        lbl.font = UIFont(name: "Montserrat-Bold", size: 14)
        
        return lbl
    }()
    
    
    lazy var idTextView: UILabel = {
        let txtV = UILabel()
        txtV.translatesAutoresizingMaskIntoConstraints = false
        txtV.text = "\(userDM.getUserID())"
        txtV.backgroundColor = .black
        txtV.textColor = .white
        txtV.textAlignment = .center
        txtV.font = UIFont(name: "Montserrat-Bold", size: 16)
        txtV.layer.cornerRadius = 15
        txtV.clipsToBounds = true
        
        return txtV
    }()
    
    lazy var backBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "backArrow"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        btn.addTarget(self, action: #selector(backPreviousVC), for: .touchUpInside)
        
        return btn
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    func playAudio() {
        var audioPlayer = AVAudioPlayer()
        let url = Bundle.main.url(forResource: "tapSound", withExtension: "mp3")
        audioPlayer = try! AVAudioPlayer(contentsOf: url!)
        audioPlayer.play()
    }
    
    
    @objc func backPreviousVC(){
        dismiss(animated: true)
        playAudio()
    }
    
    
    @objc func goInstruction(sender: UIButton){
        playAudio()
        let vc = InstructionVC()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        if sender.tag == 0 {
            vc.workShopEnabled = true
        }else{
            vc.workShopEnabled = false
        }
        present(vc, animated: true)
    }
    
    
}



extension BaseVC {
    
    
    fileprivate func configureUI(){
        bgImgVConst()
        topViewConst()
        backBtnConst()
        idViewConst()
        playerIDLblConst()
        idtextVConst()
    }
    
    
    fileprivate func bgImgVConst(){
        view.addSubview(bgImageView)
        bgImageView.top(view.topAnchor)
        bgImageView.right(view.rightAnchor)
        bgImageView.left(view.leftAnchor)
        bgImageView.bottom(view.bottomAnchor, 10)
    }
    
    
    fileprivate func topViewConst(){
        view.addSubview(topView)
        topView.top(view.topAnchor)
        topView.right(view.rightAnchor)
        topView.left(view.leftAnchor)
        if self.view.frame.height <= 736 {
            topView.height(80)
        }else if view.frame.height > 736 {
            topView.height(120)
        }
    }
    
    
    fileprivate func idViewConst(){
        view.addSubview(idView)
        idView.top(view.safeAreaLayoutGuide.topAnchor)
        idView.left(view.centerXAnchor, -40)
        idView.right(view.rightAnchor)
        idView.bottom(topView.bottomAnchor, -10)
    }
    
    
    fileprivate func backBtnConst(){
        view.addSubview(backBtn)
        backBtn.top(view.safeAreaLayoutGuide.topAnchor)
        backBtn.left(view.leftAnchor)
        backBtn.bottom(topView.bottomAnchor)
        backBtn.width(60)
    }
    
    
    fileprivate func playerIDLblConst(){
        idView.addSubview(playerIDLabel)
        playerIDLabel.centerY(idView.centerYAnchor)
        playerIDLabel.left(idView.leftAnchor, 5)
    }
    
    
    fileprivate func idtextVConst(){
        idView.addSubview(idTextView)
        idTextView.left(playerIDLabel.rightAnchor, 10)
        idTextView.right(idView.rightAnchor, -10)
        idTextView.top(idView.topAnchor, 10)
        idTextView.bottom(idView.bottomAnchor, -10)
    }
    
    
}
