//
//  MainView.swift
//  UnmesaiOS
//
//  Created by Ishan Gupta on 31/12/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Welcome to Unmesa")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Production-ready iOS app")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    MainView()
}
