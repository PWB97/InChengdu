//
//  MusicViewController.swift
//  成都生活展
//
//  Created by pu on 2017/11/25.
//  Copyright © 2017年 pu. All rights reserved.
//

import UIKit
//import AVFoundation
//import AVKit

class MusicViewController: UIViewController {
    
    @IBOutlet weak var musicV: UISlider!
    @IBOutlet weak var accountL: UILabel!
    @IBOutlet weak var passwdL: UILabel!
    @IBOutlet weak var tableView: UITableView!
    let musicList:[String] = ["background.mp3",
                              "Xenogenesis.mp3",
                              "Paradise.mp3"]
    
//    var player: AVAudioPlayer?
//    var moviePlayer = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDef = UserDefaults.standard
        accountL.text = userDef.object(forKey: "account") as? String
        passwdL.text = userDef.object(forKey: "password") as? String
        musicV.value = 1
        let rightBtn = UIBarButtonItem(title: "注销", style: .plain, target: self, action: #selector(btnClicked))
        navigationItem.rightBarButtonItem = rightBtn
        musicV.addTarget(self, action: #selector(changeValue), for: .valueChanged)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "musicCell")
    }
    
    @objc func changeValue() {
        musicPlayer.musicTool.player?.volume = musicV.value
    }
    
//    func moviePlayWith(name:String) {
//        guard let path = Bundle.main.path(forAuxiliaryExecutable: name) else {
//            print("movie not found")
//            return
//        }
//        let movieUrl = URL(fileURLWithPath: path)
//        moviePlayer.player = AVPlayer(url: movieUrl)
//        moviePlayer.view.frame = CGRect(x: 0, y: 200, width: 375, height: 200)
//        view.addSubview(moviePlayer.view)
////        present(moviePlayer, animated: true) {
////            self.moviePlayer.player?.play()
////        }
//    }
    
    @objc func btnClicked() {
        let nextVC = LoginViewController()
        UIApplication.shared.keyWindow?.rootViewController = nextVC
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension MusicViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell", for: indexPath)
        cell.textLabel?.text = musicList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        musicPlayer.musicTool.musicPlayWith(musicName: musicList[indexPath.row])
    }
    
}
