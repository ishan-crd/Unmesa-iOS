//
//  OnboardingView.swift
//  UnmesaiOS
//
//  Created by Ishan Gupta on 31/12/25.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var onboardingManager: OnboardingManager
    @EnvironmentObject var authManager: AuthManager
    @State private var currentPage = 0
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                progressIndicator
                
                Group {
                    if currentPage == 0 {
                        OnboardingPage1(currentPage: $currentPage)
                    } else if currentPage == 1 {
                        OnboardingPage2(currentPage: $currentPage)
                    } else {
                        OnboardingPage3(currentPage: $currentPage, authManager: authManager)
                    }
                }
            }
        }
    }
    
    private var progressIndicator: some View {
        HStack(spacing: 8) {
            ForEach(0..<3) { index in
                RoundedRectangle(cornerRadius: 2)
                    .fill(index <= currentPage ? Color.white : Color(hex: "4C4C4C"))
                    .frame(height: 4)
                    .frame(maxWidth: index == currentPage ? .infinity : nil)
            }
        }
        .padding(.horizontal, 24)
        .padding(.top, 20)
        .padding(.bottom, 8)
    }
}

#Preview {
    OnboardingView()
        .environmentObject(OnboardingManager())
}

