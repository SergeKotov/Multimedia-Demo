//
//  AudioPlayer.swift
//  Multimedia Demo
//
//  Created by Serge Kotov on 09.08.2025.
//

import AVFoundation

final class AudioPlayer {
    
    var isPlaying: Bool {
        player?.isPlaying ?? false
    }
    
    func play(fileName: String) {
        if !paused {
            guard let path = Bundle.main.path(forResource: "\(fileName).mp3", ofType: nil) else {
                print( "File not found" )
                return
            }
            let fileURL = URL(fileURLWithPath: path)
            
            do {
                player = try AVAudioPlayer(contentsOf: fileURL)
            } catch {
                print( "Can't create player" )
                return
            }
            player?.numberOfLoops = -1
        }
        player?.play()
        paused = false
    }
    
    func pause() {
        player?.pause()
        paused = true
    }
    
    func stop() {
        player?.stop()
        paused = false
    }
    
    // MARK: - Private
    
    private var player: AVAudioPlayer?
    private var paused = false
}
