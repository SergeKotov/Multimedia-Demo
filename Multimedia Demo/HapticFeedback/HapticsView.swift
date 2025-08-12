//
//  HapticsView.swift
//  Multimedia Demo
//
//  Created by Serge Kotov on 09.08.2025.
//

import SwiftUI

// See for details: https://developer.apple.com/documentation/applepencil/playing-haptic-feedback-in-your-app

struct HapticsView: View {
    let title: String
    let notification = UINotificationFeedbackGenerator()
    
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
            
            Divider()
            
            HStack {
                VStack {
                    Text("Notification")
                        .font(.title)
                    List(FeedbackType.notification, id:\.self.0) { (name, type) in
                        Button(name) {
                            notification.notificationOccurred(type)
                        }
                    }
                }
                
                VStack {
                    Text("Impact")
                        .font(.title)
                    List(FeedbackType.impact, id:\.self.0) { (name, type) in
                        Button(name) {
                            let impact = UIImpactFeedbackGenerator(style: type)
                            impact.impactOccurred()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HapticsView(title: Demo.hapticFeedback.rawValue)
}
