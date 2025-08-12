//
//  Demo.swift
//  Multimedia Demo
//
//  Created by Serge Kotov on 09.08.2025.
//

import Foundation

enum Demo: String, CaseIterable, Identifiable {
    var id : String { UUID().uuidString }
    
    case systemSounds = "System Sounds"
    case audioPlayer = "Audio Player"
    case audioRecorder = "Audio Recorder"
    case midiPlayer = "MIDI Player"
    case videoPlayer = "Video Player"
    case shaderDemo = "Fragment Shader Demo"
    case hapticFeedback = "Haptic Feedback"
}
