//
//  musicPlayer.swift
//  成都生活展
//
//  Created by pu on 2017/12/17.
//  Copyright © 2017年 pu. All rights reserved.
//

import UIKit
import AVFoundation

class musicPlayer: NSObject {

    var player: AVAudioPlayer?
    static let musicTool:musicPlayer = musicPlayer()
    
    private override init() {
        
    }
    
    func musicPlayWith(musicName:String) {
        
        guard let path = Bundle.main.path(forAuxiliaryExecutable: musicName) else {
            print("music not found")
            return
        }
        
        player = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
        player?.prepareToPlay()
        player?.volume = 1
        player?.play()
        
    }
}
