//
//  AudioPlayerView.swift
//  Multimedia Demo
//
//  Created by Serge Kotov on 09.08.2025.
//

import SwiftUI

struct AudioPlayerView: View {
    let title: String
    
    var audioPlayer = AudioPlayer()
    
    var examples = (1...4).map { "0\($0)" }
    @State private var selected = "01"
    @State private var playLabel = "play"
    
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
            
            Picker("Color theme", selection: $selected) {
                ForEach(examples, id: \.self) {
                    Text($0).tag($0)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            .onChange(of: selected) {
                if audioPlayer.isPlaying {
                    audioPlayer.play(fileName: selected)
                }
            }
            
            HStack {
                Button {
                    if audioPlayer.isPlaying {
                        audioPlayer.pause()
                        playLabel = "play"
                    } else {
                        audioPlayer.play(fileName: selected)
                        playLabel = "pause"
                    }
                } label: {
                    Image(systemName: "\(playLabel).circle.fill").font(.largeTitle)
                }
                
                Button {
                    audioPlayer.stop()
                    playLabel = "play"
                } label: {
                    Image(systemName: "stop.circle.fill").font(.largeTitle)
                }
            }
        }
        .onDisappear() {
            audioPlayer.stop()
        }
    }
}

#Preview {
    AudioPlayerView(title: Demo.audioPlayer.rawValue)
}
