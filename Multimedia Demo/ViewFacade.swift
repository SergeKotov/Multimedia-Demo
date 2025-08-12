//
//  ViewFacade.swift
//  Multimedia Demo
//
//  Created by Serge Kotov on 09.08.2025.
//

import SwiftUI

struct ViewFacade: View {
    let title: Demo
    
    var body: some View {
        switch title {
        case .audioPlayer: AudioPlayerView(title: title.rawValue)
        case .audioRecorder: AudioRecorderView(title: title.rawValue)
        case .hapticFeedback: HapticsView(title: title.rawValue)
        case .midiPlayer: MIDIPlayerView(title: title.rawValue)
        case .shaderDemo: ShadersView(title: title.rawValue)
        case .systemSounds: SystemSoundView(title: title.rawValue)
        case .videoPlayer: VideoPlayerView(title: title.rawValue)
        }
    }
}

#Preview {
    ViewFacade(title: .systemSounds)
}
