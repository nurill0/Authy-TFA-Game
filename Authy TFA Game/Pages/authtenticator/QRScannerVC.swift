//
//  QRScannerVC.swift
//  Authy TFA Game
//
//  Created by Nurillo Domlajonov on 23/08/23.
//

import UIKit
import AVFoundation

class QRScannerVC: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    var video = AVCaptureVideoPreviewLayer()

    lazy var frameView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "qrframe")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        img.contentMode = .scaleAspectFit
        
        return img
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
        setUpScanner()
        configureUI()
    }
  

}



extension QRScannerVC {
    
    func setUpScanner(){
        let session = AVCaptureSession()
        
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return  }
        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            session.addInput(input)
        }
        catch
        {
            print("error ")
        }
        
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes = [.qr ]
        
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.layer.bounds
        view.layer.addSublayer(video)
        DispatchQueue.main.async {
            session.startRunning()
        }
    }
    
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        if metadataObjects != nil && metadataObjects.count != 0 {
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject {
                if  object.type == .qr {
                    frameView.image = UIImage(named: "qrframe")?.withTintColor(.green, renderingMode: .alwaysOriginal)
                    showAlert(code: object.stringValue ?? "unknown")
                    UIPasteboard.general.string = object.stringValue
                }else{
                    frameView.image = UIImage(named: "qrframe")?.withTintColor(.black, renderingMode: .alwaysOriginal)
                }
                
            }
        }
    }
    
    
    func showAlert(code: String) {
        let alertController = UIAlertController(title: code, message: nil, preferredStyle: .actionSheet)
        if code.contains("https://") {
            let copyAction = UIAlertAction(title: "Open", style: .default) { [self]  _ in
                let urlString = code
                guard let url = URL(string: urlString) else {return}
                UIApplication.shared.open(url)
                frameView.image = UIImage(named: "qrframe")?.withTintColor(.black, renderingMode: .alwaysOriginal)
            }
            alertController.addAction(copyAction)
        }else {
            let copyAction = UIAlertAction(title: "Copy", style: .default) { [self]  _ in
                UIPasteboard.general.string = code
                frameView.image = UIImage(named: "qrframe")?.withTintColor(.black, renderingMode: .alwaysOriginal)
            }
            alertController.addAction(copyAction)
        }
       
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){ [self] _ in
            frameView.image = UIImage(named: "qrframe")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        }
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func goBack(){
        dismiss(animated: true)
    }
    
}



extension QRScannerVC {
    
    fileprivate func configureUI(){
        qrFrameConst()
        backBtnConst()
    }
    
    fileprivate func qrFrameConst(){
        view.addSubview(frameView)
        view.bringSubviewToFront(frameView)
        frameView.right(view.rightAnchor)
        frameView.left(view.leftAnchor)
        frameView.centerY(view.centerYAnchor)
        frameView.height(320)
    }
    
    fileprivate func backBtnConst(){
        view.addSubview(backBtn)
        view.bringSubviewToFront(backBtn)
        backBtn.left(view.leftAnchor, 20)
        backBtn.top(view.topAnchor,55)
        backBtn.height(50)
        backBtn.width(50)
    }
}
