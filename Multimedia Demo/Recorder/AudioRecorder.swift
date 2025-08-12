//
//  AudioRecorder.swift
//  Multimedia Demo
//
//  Created by Serge Kotov on 09.08.2025.
//

import AVFoundation

final class AudioRecorder {
    var audioPlayer: AVAudioPlayer?
    var recordSession: AVAudioSession?
    var audioRecording: AVAudioRecorder?
    var audioRecord: URL?
    
    init() {
        recordSession = AVAudioSession.sharedInstance()
        do {
            try recordSession?.setCategory(.playAndRecord, mode: .default)
            try recordSession?.setActive(true)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    deinit {
        try? recordSession?.setActive(false)
    }

    func recording() -> Bool {
        let audioFile = getDocumentsDirectory().appendingPathComponent("recording.mp4a")
        audioRecord = audioFile

        do {
            audioRecording = try AVAudioRecorder(url: audioFile, settings: settings)
            audioRecording?.record()
            return true
        } catch {
            finishRecording()
            return false
        }
    }

    func finishRecording() {
        audioRecording?.stop()
        audioRecording = nil
    }
    
    // MARK: - Private
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    private let settings = [
        AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
        AVSampleRateKey: 24000,
        AVNumberOfChannelsKey: 1,
        AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
    ]

}
