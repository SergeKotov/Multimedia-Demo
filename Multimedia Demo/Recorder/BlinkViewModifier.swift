//
//  BlinkViewModifier.swift
//  Multimedia Demo
//
//  Created by Serge Kotov on 10.08.2025.
//

import SwiftUI

struct BlinkViewModifier: ViewModifier {
    let period: Double // Duration of each blink cycle
    @State private var blinking: Bool = false
    
    func body(content: Content) -> some View {
        if period > 0 {
            content
                .opacity(blinking ? 0 : 1) // Toggle opacity between 0 (invisible) and 1 (visible)
                .animation(.easeOut(duration: period).repeatForever(autoreverses: true), value: blinking) // Animate the opacity change
                .onAppear {
                    // Start the animation when the view appears
                    withAnimation {
                        blinking = true
                    }
                }
        } else {
            content
                .opacity(1)
                .onAppear {
                    blinking = false
                }
        }
    }
}

extension View {
    func blinking(period: Double = 1.0) -> some View {
        modifier(BlinkViewModifier(period: period))
    }
}
