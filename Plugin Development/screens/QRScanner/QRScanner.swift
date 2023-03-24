//
//  QRScanner.swift
//  Plugin Development
//
//  Created by Theara Kit on 9/3/23.
//

import Foundation
import UIKit
import AVFoundation

class QRScanner: UIViewController,AVCaptureMetadataOutputObjectsDelegate  {
    let imageSplash = UIButton()
    var isFlashOn: Bool = false
    
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        self.getCameraPreview()
        uiDesign()
        
    }
    
    @objc func onClickBtnBack() {
       captureSession.stopRunning()
        dismiss(animated: true)
    }
    @objc func flishLight() {
        
        if isFlashOn {
            isFlashOn = false
            imageSplash.setImage(UIImage(named: "flashlight.off"), for: .normal)
            imageSplash.tintColor = UIColor.white
        } else {
            isFlashOn = true
            imageSplash.setImage(UIImage(named: "flashlight.on"), for: .normal)
            imageSplash.tintColor = UIColor.white
        }
    }
    
    func getCameraPreview(){
        captureSession = AVCaptureSession()
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        if (captureSession.canAddInput(videoInput)){
            captureSession.addInput(videoInput)
        } else {
            showAlert()
            return
        }
        let metadataOutput = AVCaptureMetadataOutput()
        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr]
        } else {
            showAlert()
            return
        }
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer) // add preview layer to your view
        captureSession.startRunning() // start capturing
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        captureSession.stopRunning() // stop scanning after receiving metadata output
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let codeString = readableObject.stringValue else { return }
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            self.receivedCode(qrcode: codeString)
        }
    }
    
    func receivedCode(qrcode: String) {
        print(qrcode)
        let alertController = UIAlertController(title: "Success", message: qrcode, preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Ok", style: .default) { (action:UIAlertAction) in
            self.dismiss(animated: true)
        }
        alertController.addAction(action1)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    func showAlert() {
        let ac = UIAlertController(title: "Scanning not supported", message: "Your device doesn't support for scanning a QR code. Please use a device with a camera.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        captureSession = nil
    }
    
    func uiDesign() {
        
        let btnBack = UIButton()
        btnBack.setImage(UIImage(named: "btnBackQr"), for: .normal)
        btnBack.setTitle("Back", for: .normal)
        btnBack.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: -10)
        btnBack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(btnBack)
        NSLayoutConstraint.activate([
            btnBack.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            btnBack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            btnBack.heightAnchor.constraint(equalToConstant: 70)
        ])
        btnBack.addTarget(self, action: #selector(onClickBtnBack), for: .touchUpInside )
        
        
        let viewPanel = UIView()
        viewPanel.backgroundColor = .black.withAlphaComponent(0.5)
        viewPanel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewPanel)
        NSLayoutConstraint.activate([
            viewPanel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            viewPanel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewPanel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewPanel.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        let labelText = UILabel()
        labelText.text = "The QR or Barcode will be detected autoatically once you have positioned the code within camera"
        labelText.numberOfLines = 0
        labelText.textColor = .white
        labelText.textAlignment = .center
        labelText.translatesAutoresizingMaskIntoConstraints = false
        viewPanel.addSubview(labelText)
        NSLayoutConstraint.activate([
            labelText.centerYAnchor.constraint(equalTo: viewPanel.centerYAnchor, constant: -20),
            labelText.centerXAnchor.constraint(equalTo: viewPanel.centerXAnchor),
          //  labelText.topAnchor.constraint(equalTo: viewPanel.topAnchor, constant: 12),
            labelText.leadingAnchor.constraint(equalTo: viewPanel.leadingAnchor, constant: 12),
            labelText.trailingAnchor.constraint(equalTo: viewPanel.trailingAnchor,constant: -12)
        ])
        
        
        imageSplash.setImage(UIImage(named: "flashlight.off"), for: .normal)
        imageSplash.tintColor = UIColor.white
        imageSplash.translatesAutoresizingMaskIntoConstraints = false
        viewPanel.addSubview(imageSplash)
        NSLayoutConstraint.activate([
            imageSplash.topAnchor.constraint(equalTo: labelText.bottomAnchor, constant: 12),
            imageSplash.centerXAnchor.constraint(equalTo: viewPanel.centerXAnchor)
        ])
        imageSplash.addTarget(self, action: #selector(flishLight), for: .touchUpInside)
        
        
    }
    
    
    
    
    
    
}

