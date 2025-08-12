//
//  ShaderRunView.swift
//  Multimedia Demo
//
//  Created by Serge Kotov on 10.08.2025.
//

import SwiftUI
import SpriteKit

struct ShaderRunView: View {
    let code: String
    
    var body: some View {
        GeometryReader { geo in
            SpriteView(scene: StarsScene(shaderCode: code, size: geo.size))
                .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ShaderRunView(code: starsShader)
}
