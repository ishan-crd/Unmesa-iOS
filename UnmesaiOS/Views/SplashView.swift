//
//  SplashView.swift
//  UnmesaiOS
//
//  Created by Ishan Gupta on 31/12/25.
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject var authManager: AuthManager
    @State private var isActive = false
    @State private var opacity = 0.0
    
    var body: some View {
        Group {
            if isActive {
                // Login check commented out for now
                // if authManager.isLoggedIn {
                //     if authManager.showOnboarding {
                //         OnboardingView()
                //             .environmentObject(OnboardingManager())
                //             .environmentObject(authManager)
                //             .transition(.opacity)
                //     } else {
                //         MainView()
                //             .transition(.opacity)
                //     }
                // } else {
                //     LoginView()
                //         .environmentObject(authManager)
                //         .transition(.opacity)
                // }
                
                // Direct to login for now - will navigate to onboarding after login
                if authManager.showOnboarding {
                    OnboardingView()
                        .environmentObject(OnboardingManager())
                        .environmentObject(authManager)
                        .transition(.opacity)
                } else if authManager.showWelcomeTasks {
                    WelcomeTasksView()
                        .environmentObject(authManager)
                        .transition(.opacity)
                } else {
                    LoginView()
                        .environmentObject(authManager)
                        .transition(.opacity)
                }
            } else {
                ZStack {
                    Color.black
                        .ignoresSafeArea()
                    
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                        .opacity(opacity)
                }
            }
        }
        .onAppear {
            withAnimation(.easeIn(duration: 0.8)) {
                opacity = 1.0
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation(.easeOut(duration: 0.5)) {
                    isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashView()
        .environmentObject(AuthManager())
}

