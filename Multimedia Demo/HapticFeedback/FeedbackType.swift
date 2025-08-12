//
//  FeedbackType.swift
//  Multimedia Demo
//
//  Created by Serge Kotov on 09.08.2025.
//

import SwiftUI

public struct FeedbackType {
    
    static let impact: [(String, UIImpactFeedbackGenerator.FeedbackStyle)] = [
        ("heavy", .heavy),
        ("light", .light),
        ("medium", .medium),
        ("rigid", .rigid),
        ("soft", .soft),
    ]
    
    static let notification: [(String, UINotificationFeedbackGenerator.FeedbackType)] = [
        ("error", .error),
        ("success", .success),
        ("warning", .warning),
    ]
}
