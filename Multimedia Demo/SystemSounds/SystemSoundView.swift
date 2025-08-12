//
//  SystemSoundView.swift
//  Multimedia Demo
//
//  Created by Serge Kotov on 09.08.2025.
//

import SwiftUI

struct SystemSoundView: View {
    let title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
            
            List(SystemSound.systemSounds, id:\.self.0) { (id, name) in
                Button("\(id)  \(name)") {
                    SystemSound.play(id: id)
                }
            }
        }
    }
}

#Preview {
    SystemSoundView(title: Demo.systemSounds.rawValue)
}
