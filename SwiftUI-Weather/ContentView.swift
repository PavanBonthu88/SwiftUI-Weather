//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Pavan Kumar Bonthu on 19/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Hyderabad, Telangana")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    ContentView()
}
