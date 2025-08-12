//
//  MIDIPlayerView.swift
//  Multimedia Demo
//
//  Created by Serge Kotov on 10.08.2025.
//

import SwiftUI

struct MIDIPlayerView: View {
    let title: String
    
    var midiPlayer = MIDIPlayer()
    
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
                if midiPlayer.isPlaying {
                    midiPlayer.play(fileName: selected)
                }
            }
            
            HStack {
                Button {
                    playLabel = "restart"
                    midiPlayer.play(fileName: selected)
                } label: {
                    Image(systemName: "\(playLabel).circle.fill").font(.largeTitle)
                }
                
                Button {
                    midiPlayer.stop()
                    playLabel = "play"
                } label: {
                    Image(systemName: "stop.circle.fill").font(.largeTitle)
                }
            }
        }
        .onDisappear() {
            midiPlayer.stop()
        }
    }
}

#Preview {
    MIDIPlayerView(title: Demo.midiPlayer.rawValue)
}



//struct MIDIPlayerView: View {
//    @State private var midiPlayer: AVMIDIPlayer?
//
//    var body: some View {
//        VStack {
//            Button("Load and Play MIDI") {
//                loadAndPlayMIDI()
//            }
//            Button("Stop MIDI") {
//                stopMIDI()
//            }
//        }
//    }
//
//    func loadAndPlayMIDI() {
//        guard let midiFileURL = Bundle.main.url(forResource: "04", withExtension: "mid") else {
//            print("MIDI file not found.")
//            return
//        }
//
//        do {
//            let midi = Bundle.main.url(forResource: "TimGM6mb", withExtension: "sf2")!
//            midiPlayer = try AVMIDIPlayer(contentsOf: midiFileURL, soundBankURL: midi)
//            midiPlayer?.prepareToPlay()
//            midiPlayer?.play()
//        } catch {
//            print("Error loading or playing MIDI: \(error.localizedDescription)")
//        }
//    }
//
//    func stopMIDI() {
//        midiPlayer?.stop()
//    }
//}
//
//#Preview {
//    MIDIPlayerView()
//}
