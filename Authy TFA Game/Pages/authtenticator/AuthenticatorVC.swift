//
//  AuthenticatorVC.swift
//  Authy TFA Game
//
//  Created by Nurillo Domlajonov on 22/08/23.
//

import UIKit
import AVFoundation
import VisionKit

class AuthenticatorVC: BaseVC {
    
    var time = 30
    
    lazy var centerImg: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "center")
        img.contentMode = .scaleAspectFill
        
        return img
    }()
    
    lazy var instructionBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Instruction", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .buttonBgColor()
        btn.layer.cornerRadius = 10
        btn.titleLabel?.font = UIFont(name: "Khand-Medium", size: 28)
        btn.addTarget(self, action: #selector(goInstruction), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var frameView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.layer.borderColor =  #colorLiteral(red: 0.2403740585, green: 0.5999547243, blue: 0.9316031337, alpha: 1).cgColor
        view.layer.borderWidth = 3
        
        return view
    }()
    
    lazy var scanBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "scanBtn"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(scanQR), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var codeBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "codeBtn"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(createCode), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var simpleImgV: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "simple")
        img.contentMode = .scaleAspectFit
        
        return img
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
        tf.isHidden = true
        
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
        btn.isHidden = true
        
        return btn
    }()
    
    
    lazy var timerLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "\(time)"
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.font = UIFont(name: "Khand-Medium", size: 28)
        lbl.isHidden = true
        
        return lbl
    }()
    
    
    var timer: Timer!
    var secundomer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAuthUI()
    }
    
}



//actions
extension AuthenticatorVC {
    
    @objc func goInstruction(){
        let vc = InstructionVC()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    
    @objc func createCode(){
        time = 30
        timerLbl.text = "\(time)"
        timerLbl.isHidden = false
        textFieldBgView.isHidden = false
        keyTf.isHidden = false
        copyBtn.isHidden = false
        codeBtn.isHidden = true
        scanBtn.isHidden = true
        simpleImgV.image = UIImage(named: "simple2")
        let randomString = randomAlphanumericString(6)
        keyTf.text = randomString
        authenticatorBtn.isEnabled = false
        timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(resetCode), userInfo: nil, repeats: true)
        secundomer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countTime), userInfo: nil, repeats: true)
    }
    
    @objc func resetCode(){
        time = 30
        textFieldBgView.isHidden = true
        keyTf.isHidden = true
        copyBtn.isHidden = true
        codeBtn.isHidden = false
        scanBtn.isHidden = false
        simpleImgV.image = UIImage(named: "simple")
        timer.invalidate()
        secundomer.invalidate()
        timerLbl.isHidden = true
    }
    
    @objc func countTime(){
        time-=1
        timerLbl.isHidden = false
        timerLbl.text = "\(time)"
        if time == 0{
            time = 30
        }
    }
    
    //copy textfield text to clipboard when copyBtn tapped
    @objc func copyCode(){
        guard let key = keyTf.text, !key.isEmpty else {return}
        UIPasteboard.general.string = key
    }
    
    
    @objc func scanQR(){
        let vc = QRScannerVC()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
    
    
}



//UI
extension AuthenticatorVC {
    
    fileprivate func configureAuthUI(){
        authenticatorBtn.setTitleColor(.white, for: .normal)
        roomkeyBtn.setTitleColor(.black, for: .normal)
        gameboosterBtn.setTitleColor(.black, for: .normal)
        centerImgConst()
        instructionBtnConst()
        frameViewCOnst()
        scanBtnConst()
        codeBtnConst()
        simpleImgConst()
        tfBgConst()
        keyTFConst()
        copyBtnConst()
        timeLblConst()
    }
    
    
    fileprivate func centerImgConst(){
        view.addSubview(centerImg)
        centerImg.right(view.rightAnchor)
        centerImg.left(view.leftAnchor)
        centerImg.centerY(view.centerYAnchor, -70)
    }
    
    
    fileprivate func instructionBtnConst(){
        view.addSubview(instructionBtn)
        instructionBtn.top(view.topAnchor, 60)
        instructionBtn.left(view.leftAnchor, 20)
        instructionBtn.height(50)
        instructionBtn.width(140)
    }
    
    
    fileprivate func frameViewCOnst(){
        view.addSubview(frameView)
        frameView.centerY(centerImg.centerYAnchor)
        frameView.right(view.rightAnchor, -20)
        frameView.left(view.leftAnchor, 20)
        if view.frame.height > 670{
            frameView.height(240)
        }else{
            frameView.height(180)
        }
    }
    
    
    fileprivate func scanBtnConst(){
        frameView.addSubview(scanBtn)
        scanBtn.left(frameView.leftAnchor, 30)
        scanBtn.centerY(frameView.centerYAnchor)
        scanBtn.height(115)
        scanBtn.width(115)
    }
    
    
    fileprivate func codeBtnConst(){
        frameView.addSubview(codeBtn)
        codeBtn.right(frameView.rightAnchor, -30)
        codeBtn.centerY(frameView.centerYAnchor)
        codeBtn.height(115)
        codeBtn.width(115)
    }
    
    
    fileprivate func simpleImgConst(){
        view.addSubview(simpleImgV)
        simpleImgV.top(frameView.bottomAnchor, 20)
        simpleImgV.centerX(view.centerXAnchor)
        simpleImgV.bottom(frameBtnsView.topAnchor, -20)
    }
    
    //changable UI
    fileprivate func tfBgConst(){
        view.addSubview(textFieldBgView)
        textFieldBgView.centerY(frameView.centerYAnchor)
        textFieldBgView.right(frameView.rightAnchor, -35)
        textFieldBgView.left(frameView.leftAnchor, 35)
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
    
    
    fileprivate func timeLblConst(){
        simpleImgV.addSubview(timerLbl)
        timerLbl.centerY(simpleImgV.centerYAnchor)
        timerLbl.centerX(simpleImgV.centerXAnchor)
    }
    
    
    
}
