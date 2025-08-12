//
//  ShadersView.swift
//  Multimedia Demo
//
//  Created by Serge Kotov on 10.08.2025.
//

import SwiftUI

import SwiftUI

struct ShadersView: View {
    let title: String
    
    @State private var toggler = true
    
    var body: some View {
        ZStack {
            if toggler {
                ShaderRunView(code: starsShader)
            } else {
                ShaderRunView(code: warpShader)
            }
            
            Button {
                toggler.toggle()
            } label: {
                Text("Toggle shader")
                    .font(.title)
                    .foregroundStyle(.white)

            }
        }
    }
}

#Preview {
    ShadersView(title: Demo.shaderDemo.rawValue)
}

