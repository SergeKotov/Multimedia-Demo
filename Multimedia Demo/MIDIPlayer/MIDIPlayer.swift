//
//  MIDIPlayer.swift
//  Multimedia Demo
//
//  Created by Serge Kotov on 10.08.2025.
//

import AVFoundation

final class MIDIPlayer {

    var isPlaying: Bool {
        player?.isPlaying ?? false
    }
    
    func play(fileName: String) {
        guard let path = Bundle.main.path(forResource: "\(fileName).mid", ofType: nil) else {
            print( "File not found" )
            return
        }
        let fileURL = URL(fileURLWithPath: path)
        
        do {
            player = try AVMIDIPlayer(contentsOf: fileURL, soundBankURL: soundBank)
        } catch {
            print( "Can't create player" )
            return
        }
        player?.play()
    }
    
    func stop() {
        player?.stop()
    }
    
    // MARK: - Private
    
    private var player: AVMIDIPlayer?
    private let soundBank = Bundle.main.url(forResource: "TimGM6mb", withExtension: "sf2")
}
