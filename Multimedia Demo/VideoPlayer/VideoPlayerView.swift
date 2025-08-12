//
//  VideoPlayerView.swift
//  Multimedia Demo
//
//  Created by Serge Kotov on 09.08.2025.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    let title: String
    
    @State var videoPlayer = AVPlayer(url:  URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8")!)

    @State var isPlaying: Bool = false
        
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
            
            VideoPlayer(player: videoPlayer) {
                VStack {
                    Text("Bip-bop video example")
                        .foregroundStyle(.white)
                        .padding()
                    Spacer()
                }
            }
        }
        .onDisappear() {
            videoPlayer.pause()
        }
    }
}

#Preview {
    VideoPlayerView(title: Demo.videoPlayer.rawValue)
}

// UIKit: AVPlayerViewController
