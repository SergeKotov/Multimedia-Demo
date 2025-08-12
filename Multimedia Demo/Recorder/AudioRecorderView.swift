//
//  AudioRecorderView.swift
//  Multimedia Demo
//
//  Created by Serge Kotov on 09.08.2025.
//

import SwiftUI
import AVFoundation

struct AudioRecorderView: View {
    let title: String
    var recorder = AudioRecorder()
    
    @State private var granted = false
    @State private var state = RecorderState.opening
    
    var body: some View {
        if granted {
            VStack {
                Text(title)
                    .font(.largeTitle)
                    .padding()
                
                if state != .playing {
                    Button {
                        if recorder.audioRecording == nil {
                            state = recorder.recording() ? .recording : .stopped
                        } else {
                            recorder.finishRecording()
                            state = .stopped
                        }
                    } label: {
                        Text("Tap to \(waitRecord ? "start" : "stop") recording")
                        Spacer()
                        Image(systemName: "record.circle.fill").font(.largeTitle)
                            .foregroundStyle(.red)
                            .blinking(period: (waitRecord ? 0 : 0.5))
                    }
                }
                
                Divider()
                
                if waitPlay {
                    Button {
                        if let record = recorder.audioRecord {
                            do {
                                recorder.audioPlayer = try AVAudioPlayer(contentsOf: record)
                                recorder.audioPlayer?.prepareToPlay()
                                recorder.audioPlayer?.play()
                                state = .playing
                            } catch {
                                recorder.audioPlayer?.stop()
                                state = .stopped
                            }
                        }
                    } label: {
                        Text("Tap to play recording")
                        Spacer()
                        Image(systemName: "play.circle.fill").font(.largeTitle)
                    }
                }
            }
            .padding()
        } else {
            Text("Please grant microphone access")
                .task {
                    if await AVAudioApplication.requestRecordPermission() {
                        granted = true
                    }
                }
        }
        
    }
    
    var waitRecord: Bool {
        state == .opening || state == .stopped
    }
    
    var waitPlay: Bool {
        state == .stopped || state == .playing
    }
}

#Preview {
    AudioRecorderView(title: Demo.audioRecorder.rawValue)
}
