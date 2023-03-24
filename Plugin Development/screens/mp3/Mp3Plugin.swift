//
//  Mp3Plugin.swift
//  Plugin Development
//
//  Created by Theara Kit on 9/3/23.
//

import Foundation
import UIKit

class Mp3Plugin: UIViewController {
    
    var songIndex: Int = 0
    var songArtistIndex: String = ""
    let txtLabel = UILabel()
    let txtSinger = UILabel()
    let btnPlay = UIButton()
    let durationTimeEnd = UILabel()
    let durationTimeStart = UILabel()
    var isPlaying: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
                buildMusicPM3()
        
                initializeMP3(songIndex: songIndex)
    }
   
        @objc func onBtnBack() {
            print("UIKit btnBack")
            songIndex -= 1
            if songIndex < 0{
                songIndex = 0
    
            }
            initializeMP3(songIndex: songIndex)
            print(songIndex)
        }
        @objc func onBtnNext() {
            songIndex += 1
            if songIndex > songList.count - 1 {
                songIndex = songList.count - 1
            }
            initializeMP3(songIndex: songIndex)
            print(songIndex)
    
        }
        @objc func onBtnRepeat() {
            print("UIKit btnRepeat")
        }
        @objc func onBtnSkip() {
            print("UIKit btnSkip")
        }
    
    private func initializeMP3(songIndex: Int) {
        if let currentSongTitle = songList[songIndex]["songTitle"] as? String {
            txtLabel.text = currentSongTitle
        }
        if let currentSongArtist = songList[songIndex]["songArtist"] as? String{
            txtSinger.text = currentSongArtist
        }
    }
    
    @objc func onClickBack() {
        dismiss(animated: true)
        //print("Hello Back ===>")
        

    }
    @objc func onBtnPlay() {
        print("UIKit btnPlay")
        if isPlaying  {
            print("pause MP3")
            isPlaying = false
            btnPlay.setImage(UIImage(named: "btnPlay"), for: .normal)
        } else{
            print("Play")
            isPlaying = true
            btnPlay.setImage(UIImage(named: "pause"), for: .normal)
        }
    }
    
    func buildMusicPM3() {
        view.backgroundColor = .gray
        
        let btnBack = UIButton()
        btnBack.layer.cornerRadius = 8
        btnBack.backgroundColor = .blue
        btnBack.setTitle("Back", for: .normal)
        btnBack.tintColor = .black
        view.addSubview(btnBack)
        btnBack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            btnBack.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            btnBack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            btnBack.widthAnchor.constraint(equalToConstant: 80)
        ])
        btnBack.addTarget(self, action: #selector(onClickBack), for: .touchUpInside)
        
        let panelBtns = UIView()
//        panelBtns.backgroundColor = .blue
        panelBtns.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(panelBtns)
        NSLayoutConstraint.activate([
            panelBtns.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            panelBtns.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            panelBtns.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            panelBtns.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        let interaction = UISlider()
        interaction.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(interaction)
        NSLayoutConstraint.activate([
            interaction.bottomAnchor.constraint(equalTo: panelBtns.topAnchor, constant: 12),
            interaction.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            interaction.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12)
        ])
        
        let panelDuration = UIView()
        panelDuration.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(panelDuration)
        NSLayoutConstraint.activate([
            panelDuration.bottomAnchor.constraint(equalTo: interaction.topAnchor, constant: -12),
            panelDuration.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            panelDuration.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            panelDuration.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        
        
        txtSinger.text = "Justin beiber"
        txtSinger.translatesAutoresizingMaskIntoConstraints = false
        txtSinger.font = (.systemFont(ofSize: 18))
        txtSinger.textAlignment = .center
        view.addSubview(txtSinger)
        NSLayoutConstraint.activate([
            txtSinger.bottomAnchor.constraint(equalTo: panelDuration.topAnchor,constant: -12),
            txtSinger.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            txtSinger.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        
        txtLabel.text = "What do you mean?"
        txtLabel.textColor = .black
        txtLabel.numberOfLines = 2
        txtLabel.textAlignment = .center
        txtLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(txtLabel)
        //        txtLabel.textAlignment = .center
        txtLabel.font = (.systemFont(ofSize: 25))
        NSLayoutConstraint.activate([
            txtLabel.bottomAnchor.constraint(equalTo: txtSinger.topAnchor,constant: -12),
            txtLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            txtLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        let imageSong = UIImage(named: "ImageSong")
        let myImageView = UIImageView()
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        myImageView.contentMode = UIView.ContentMode.scaleAspectFit
        myImageView.frame.size.height = 100
        myImageView.frame.size.width = 100
        myImageView.center = self.view.center
        myImageView.image = imageSong
        view.addSubview(myImageView)
        self.view = view
        NSLayoutConstraint.activate([
           
            myImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            myImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            myImageView.topAnchor.constraint(equalTo: btnBack.bottomAnchor, constant: 12),
            myImageView.bottomAnchor.constraint(equalTo: txtLabel.topAnchor)
        ])
        
        
        
        durationTimeStart.text = "00:00"
        durationTimeStart.translatesAutoresizingMaskIntoConstraints = false
        panelDuration.addSubview(durationTimeStart)
        NSLayoutConstraint.activate([
            durationTimeStart.centerYAnchor.constraint(equalTo: panelDuration.centerYAnchor),
            durationTimeStart.leadingAnchor.constraint(equalTo: panelDuration.leadingAnchor),
        ])
        
        
        durationTimeEnd.text = "06:12"
        durationTimeEnd.translatesAutoresizingMaskIntoConstraints = false
        panelDuration.addSubview(durationTimeEnd)
        NSLayoutConstraint.activate([
            durationTimeEnd.centerYAnchor.constraint(equalTo: panelDuration.centerYAnchor),
            durationTimeEnd.trailingAnchor.constraint(equalTo: panelDuration.trailingAnchor)
        ])
        
        
        
        btnPlay.setImage(UIImage(named: "btnPlay"), for: .normal)
        
        btnPlay.translatesAutoresizingMaskIntoConstraints = false
        panelBtns.addSubview(btnPlay)
        NSLayoutConstraint.activate([
            btnPlay.centerXAnchor.constraint(equalTo: panelBtns.centerXAnchor),
            //btnPlay.centerYAnchor.constraint(equalTo: panelBtns.centerYAnchor),
            btnPlay.topAnchor.constraint(equalTo: panelBtns.topAnchor),
            btnPlay.bottomAnchor.constraint(equalTo: panelBtns.bottomAnchor)
        ])
        btnPlay.addTarget(self, action: #selector(onBtnPlay), for: .touchUpInside)
        
        
        let btnPlayNext = UIButton()
        btnPlayNext.setImage(UIImage(named: "btnNext"), for: .normal)
        //        btnPlayNext.frame.size = CGSize(width: 80, height: 80)
        btnPlayNext.translatesAutoresizingMaskIntoConstraints = false
        panelBtns.addSubview(btnPlayNext)
        NSLayoutConstraint.activate([
            btnPlayNext.centerYAnchor.constraint(equalTo: panelBtns.centerYAnchor),
            btnPlayNext.leadingAnchor.constraint(equalTo:btnPlay.trailingAnchor, constant: 12),
        ])
        btnPlayNext.addTarget(self, action: #selector(onBtnNext), for: .touchUpInside)
        
        
        let btnPlayBack = UIButton()
        btnPlayBack.setImage(UIImage(named: "btnBack"), for: .normal)
        btnPlayBack.translatesAutoresizingMaskIntoConstraints = false
        panelBtns.addSubview(btnPlayBack)
        NSLayoutConstraint.activate([
            btnPlayBack.centerYAnchor.constraint(equalTo: panelBtns.centerYAnchor),
            btnPlayBack.trailingAnchor.constraint(equalTo:btnPlay.leadingAnchor, constant: -12),
        ])
        btnPlayBack.addTarget(self, action: #selector(onBtnBack), for: .touchUpInside)
        
        let btnPlayAgain = UIButton()
        btnPlayAgain.setImage(UIImage(named: "btnRepeat"), for: .normal)
        btnPlayAgain.translatesAutoresizingMaskIntoConstraints = false
        panelBtns.addSubview(btnPlayAgain)
        NSLayoutConstraint.activate([
            btnPlayAgain.centerYAnchor.constraint(equalTo: panelBtns.centerYAnchor),
            btnPlayAgain.trailingAnchor.constraint(equalTo:btnPlayBack.leadingAnchor, constant: -12),
        ])
        btnPlayAgain.addTarget(self, action: #selector(onBtnRepeat), for: .touchUpInside)
        
        let btnPlaySkip = UIButton()
        btnPlaySkip.setImage(UIImage(named: "btnSkip"), for: .normal)
        
        btnPlaySkip.translatesAutoresizingMaskIntoConstraints = false
        panelBtns.addSubview(btnPlaySkip)
        NSLayoutConstraint.activate([
            btnPlaySkip.centerYAnchor.constraint(equalTo: panelBtns.centerYAnchor),
            btnPlaySkip.leadingAnchor.constraint(equalTo:btnPlayNext.trailingAnchor, constant: 12),
        ])
        btnPlaySkip.addTarget(self, action: #selector(onBtnSkip), for: .touchUpInside)
        
    }
    
    
}
