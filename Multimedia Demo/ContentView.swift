//
//  ContentView.swift
//  Multimedia Demo
//
//  Created by Serge Kotov on 08.08.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(Demo.allCases) { demo in
                NavigationLink {
                    ViewFacade(title: demo)
                } label: {
                    Text(demo.rawValue)
                }
            }
            .navigationTitle("Multimedia Demo")
            .listStyle(.plain)
        }
    }
}

#Preview {
    ContentView()
}
