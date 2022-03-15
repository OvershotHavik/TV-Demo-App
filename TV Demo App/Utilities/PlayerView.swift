//
//  PlayerView.swift
//  TV Demo App
//
//  Created by Steve Plavetzky on 3/15/22.
//

import SwiftUI
import AVKit
    

struct PlayerView: View {
    @State private var player: AVQueuePlayer?
    @State private var videoLooper: AVPlayerLooper?
    var url: String
    
    var body: some View {
        VideoPlayer(player: player)
            .ignoresSafeArea()
            .onAppear {
                if player == nil{
                    guard let url = URL(string: url) else {return}
                    let templateItem = AVPlayerItem(url: url)
                    player = AVQueuePlayer(playerItem: templateItem)
                    if let player = player {
                        videoLooper = AVPlayerLooper(player: player, templateItem: templateItem)
                    }
                }
                if player?.isPlaying == false{
                    player?.play()
                }
            }
    }
}

extension AVPlayer {
  var isPlaying: Bool {
    return rate != 0 && error == nil
  }
}
